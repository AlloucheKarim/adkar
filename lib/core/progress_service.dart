import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'repository.dart';
import 'models.dart';

/// Représente une catégorie d'adhkars terminée à une date donnée.
class DhikrLogEntry {
  final String date; // Format: 'yyyy-MM-dd'
  final DhikrCategory category;

  const DhikrLogEntry({required this.date, required this.category});

  Map<String, dynamic> toJson() => {
    'date': date,
    'category': category.name,
  };

  factory DhikrLogEntry.fromJson(Map<String, dynamic> json) {
    return DhikrLogEntry(
      date: json['date'] as String,
      category: DhikrCategory.values.firstWhere(
        (c) => c.name == json['category'],
        orElse: () => DhikrCategory.morning,
      ),
    );
  }
}

class ProgressService extends ChangeNotifier {
  static final ProgressService _instance = ProgressService._internal();
  factory ProgressService() => _instance;
  ProgressService._internal();

  static const String _completedKey = 'completed_dhikr_ids';
  static const String _dateKey = 'progress_date';
  static const String _activeDatesKey = 'active_dates';
  static const String _dhikrLogsKey = 'dhikr_logs';

  final Set<String> _completedIds = {};
  final List<String> _activeDates = [];
  final List<DhikrLogEntry> _dhikrLogs = [];

  Set<String> get completedIds => _completedIds;
  List<String> get activeDates => List.unmodifiable(_activeDates);
  List<DhikrLogEntry> get dhikrLogs => List.unmodifiable(_dhikrLogs);

  static const List<DhikrCategory> _allCategories = [
    DhikrCategory.wakingUp,
    DhikrCategory.morning,
    DhikrCategory.afterPrayer,
    DhikrCategory.leavingHome,
    DhikrCategory.enteringHome,
    DhikrCategory.evening,
    DhikrCategory.sleep,
  ];

  Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load active dates
      final List<String>? savedActiveDates = prefs.getStringList(_activeDatesKey);
      if (savedActiveDates != null) {
        _activeDates.clear();
        _activeDates.addAll(savedActiveDates);
      }

      // Load dhikr logs
      final List<String>? savedLogs = prefs.getStringList(_dhikrLogsKey);
      if (savedLogs != null) {
        _dhikrLogs.clear();
        for (final s in savedLogs) {
          try {
            _dhikrLogs.add(DhikrLogEntry.fromJson(json.decode(s) as Map<String, dynamic>));
          } catch (_) {}
        }
      }

      // Check current date against stored progress date
      final String? storedDate = prefs.getString(_dateKey);
      final String todayStr = _getTodayDateStr();

      if (storedDate == todayStr) {
        // Load completed IDs for today
        final List<String>? savedCompleted = prefs.getStringList(_completedKey);
        if (savedCompleted != null) {
          _completedIds.clear();
          _completedIds.addAll(savedCompleted);
        }
      } else {
        // It's a new day, clear completed IDs, update stored date
        _completedIds.clear();
        await prefs.setString(_dateKey, todayStr);
        await prefs.setStringList(_completedKey, []);
      }
      notifyListeners();
    } catch (e) {
      debugPrint('Failed to initialize ProgressService: $e');
    }
  }

  String _getTodayDateStr() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  void markCompleted(String id) async {
    if (!_completedIds.contains(id)) {
      _completedIds.add(id);

      // Record today as active
      final todayStr = _getTodayDateStr();
      if (!_activeDates.contains(todayStr)) {
        _activeDates.add(todayStr);
      }

      // Check if the entire category is now complete → add to log
      _checkAndAddCategoryLog(id, todayStr);

      notifyListeners();
      await _saveToStorage();
    }
  }

  void unmarkCompleted(String id) async {
    if (_completedIds.contains(id)) {
      _completedIds.remove(id);

      final todayStr = _getTodayDateStr();

      // Find which category this dhikr belongs to and remove its log entry if category is no longer complete
      for (final cat in _allCategories) {
        final catIds = DhikrRepository.getByCategory(cat).map((d) => d.id).toSet();
        if (catIds.contains(id)) {
          // Category is no longer fully complete → remove today's log for this category
          _dhikrLogs.removeWhere((e) => e.date == todayStr && e.category == cat);
          break;
        }
      }

      // If no dhikrs completed at all today, remove today from active dates
      bool hasAnyCompletedToday = false;
      for (var cat in _allCategories) {
        final list = DhikrRepository.getByCategory(cat);
        if (_completedIds.intersection(list.map((d) => d.id).toSet()).isNotEmpty) {
          hasAnyCompletedToday = true;
          break;
        }
      }
      if (!hasAnyCompletedToday) {
        _activeDates.remove(todayStr);
      }

      notifyListeners();
      await _saveToStorage();
    }
  }

  void _checkAndAddCategoryLog(String justCompletedId, String todayStr) {
    for (final cat in _allCategories) {
      final catIds = DhikrRepository.getByCategory(cat).map((d) => d.id).toSet();
      if (!catIds.contains(justCompletedId)) continue;

      // Check if all dhikrs in this category are now completed
      final allDone = _completedIds.containsAll(catIds);
      if (!allDone) break;

      // Avoid duplicate entries for the same date+category
      final alreadyLogged = _dhikrLogs.any((e) => e.date == todayStr && e.category == cat);
      if (!alreadyLogged) {
        _dhikrLogs.add(DhikrLogEntry(date: todayStr, category: cat));
      }
      break;
    }
  }

  void resetProgress() async {
    _completedIds.clear();
    final todayStr = _getTodayDateStr();
    _activeDates.remove(todayStr);
    // Remove today's log entries
    _dhikrLogs.removeWhere((e) => e.date == todayStr);
    notifyListeners();
    await _saveToStorage();
  }

  void deleteLogEntry(String date, DhikrCategory category) async {
    _dhikrLogs.removeWhere((e) => e.date == date && e.category == category);
    notifyListeners();
    await _saveToStorage();
  }

  Future<void> _saveToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_completedKey, _completedIds.toList());
      await prefs.setStringList(_activeDatesKey, _activeDates);
      await prefs.setString(_dateKey, _getTodayDateStr());
      await prefs.setStringList(
        _dhikrLogsKey,
        _dhikrLogs.map((e) => json.encode(e.toJson())).toList(),
      );
    } catch (e) {
      debugPrint('Failed to save progress to storage: $e');
    }
  }

  int getCompletedCountForCategory(List<String> categoryDhikrIds) {
    return _completedIds.intersection(categoryDhikrIds.toSet()).length;
  }

  int getStreak() {
    if (_activeDates.isEmpty) return 0;

    final dates = _activeDates
        .map((d) {
          try {
            return DateUtils.dateOnly(DateTime.parse(d));
          } catch (_) {
            return null;
          }
        })
        .whereType<DateTime>()
        .toSet()
        .toList();

    if (dates.isEmpty) return 0;

    dates.sort((a, b) => b.compareTo(a));

    final now = DateTime.now();
    final today = DateUtils.dateOnly(now);
    final yesterday = today.subtract(const Duration(days: 1));

    final latestActiveDay = dates.first;
    if (latestActiveDay != today && latestActiveDay != yesterday) {
      return 0;
    }

    int streak = 0;
    DateTime currentCheck = latestActiveDay;

    for (int i = 0; i < dates.length; i++) {
      if (dates.contains(currentCheck)) {
        streak++;
        currentCheck = currentCheck.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }

    return streak;
  }
}
