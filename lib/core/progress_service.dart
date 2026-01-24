import 'package:flutter/material.dart';

class ProgressService extends ChangeNotifier {
  static final ProgressService _instance = ProgressService._internal();
  factory ProgressService() => _instance;
  ProgressService._internal();

  final Set<String> _completedIds = {};

  Set<String> get completedIds => _completedIds;

  void markCompleted(String id) {
    if (!_completedIds.contains(id)) {
      _completedIds.add(id);
      notifyListeners();
    }
  }

  void unmarkCompleted(String id) {
    if (_completedIds.contains(id)) {
      _completedIds.remove(id);
      notifyListeners();
    }
  }

  void resetProgress() {
    _completedIds.clear();
    notifyListeners();
  }

  double getCategoryProgress(String categoryTag, int totalInOps) {
    if (totalInOps == 0) return 0;
    // Note: We need to filter IDs based on category prefix if we want to be efficient,
    // but a simple count on ids starting with categoryTag might work if IDs are structured.
    // However, it's safer to pass the list of IDs belonging to that category.
    return 0; // Placeholder, will be used with better logic
  }
  
  int getCompletedCountForCategory(List<String> categoryDhikrIds) {
    return _completedIds.intersection(categoryDhikrIds.toSet()).length;
  }
}
