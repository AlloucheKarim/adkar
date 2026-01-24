import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  static final ThemeService _instance = ThemeService._internal();
  factory ThemeService() => _instance;
  ThemeService._internal() {
    _checkTime();
  }

  bool _isNightMode = false;
  bool get isNightMode => _isNightMode;

  void toggle() {
    _isNightMode = !_isNightMode;
    notifyListeners();
  }

  void _checkTime() {
    final hour = DateTime.now().hour;
    // Activate night mode between 6 PM (18:00) and 6 AM (06:00)
    if (hour >= 18 || hour < 6) {
      _isNightMode = true;
      notifyListeners();
    }
  }

  // Helper to force check (e.g., on app resume)
  void checkSystemTime() => _checkTime();
}
