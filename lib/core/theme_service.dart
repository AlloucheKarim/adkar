import 'dart:async';
import 'package:flutter/material.dart';

class ThemeService extends ChangeNotifier {
  static final ThemeService _instance = ThemeService._internal();
  factory ThemeService() => _instance;
  ThemeService._internal() {
    _checkTime();
    _startTimer();
  }

  bool _isNightMode = false;
  bool get isNightMode => _isNightMode;
  Timer? _timer;

  void toggle() {
    _isNightMode = !_isNightMode;
    notifyListeners();
  }

  void _checkTime() {
    final hour = DateTime.now().hour;
    final bool shouldBeNight = hour >= 18 || hour < 6;
    if (_isNightMode != shouldBeNight) {
      _isNightMode = shouldBeNight;
      notifyListeners();
    }
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 15), (_) => _checkTime());
  }

  // Helper to force check (e.g., on app resume)
  void checkSystemTime() => _checkTime();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
