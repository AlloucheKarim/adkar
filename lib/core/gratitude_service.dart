import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GratitudeEntry {
  final String date;
  final String content;

  GratitudeEntry({required this.date, required this.content});

  Map<String, dynamic> toJson() => {'date': date, 'content': content};
  factory GratitudeEntry.fromJson(Map<String, dynamic> json) =>
      GratitudeEntry(date: json['date'], content: json['content']);
}

class GratitudeService extends ChangeNotifier {
  static final GratitudeService _instance = GratitudeService._internal();
  factory GratitudeService() => _instance;
  GratitudeService._internal();

  static const String _storageKey = 'gratitude_entries';
  final List<GratitudeEntry> _entries = [];
  List<GratitudeEntry> get entries => List.unmodifiable(_entries);

  GratitudeEntry? get latestEntry => _entries.isEmpty ? null : _entries.last;

  Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? encodedData = prefs.getString(_storageKey);
      if (encodedData != null) {
        final List<dynamic> decodedData = json.decode(encodedData);
        _entries.clear();
        _entries.addAll(
          decodedData.map((item) => GratitudeEntry.fromJson(item)).toList(),
        );
        notifyListeners();
      }
    } catch (e) {
      debugPrint('GratitudeService initialization failed: $e');
    }
  }

  void addEntry(String content) async {
    final now = DateTime.now();
    final dateStr = '${now.day}/${now.month}/${now.year}';

    // Check if we already have an entry for today and update it, or add new
    int index = _entries.indexWhere((e) => e.date == dateStr);
    if (index != -1) {
      _entries[index] = GratitudeEntry(date: dateStr, content: content);
    } else {
      _entries.add(GratitudeEntry(date: dateStr, content: content));
    }

    notifyListeners();
    await _saveToStorage();
  }

  GratitudeEntry? getTodaysEntry() {
    final now = DateTime.now();
    final dateStr = '${now.day}/${now.month}/${now.year}';
    try {
      return _entries.firstWhere((e) => e.date == dateStr);
    } catch (_) {
      return null;
    }
  }

  Future<void> _saveToStorage() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String encodedData = json.encode(
        _entries.map((e) => e.toJson()).toList(),
      );
      await prefs.setString(_storageKey, encodedData);
    } catch (e) {
      debugPrint('Failed to save gratitude entries: $e');
    }
  }
}
