import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class HapticService {
  static final HapticService _instance = HapticService._internal();
  factory HapticService() => _instance;
  HapticService._internal();

  bool _isVibrationEnabled = true;
  bool get isVibrationEnabled => _isVibrationEnabled;

  final ValueNotifier<bool> vibrationNotifier = ValueNotifier<bool>(true);

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _isVibrationEnabled = prefs.getBool('vibration_enabled') ?? true;
    vibrationNotifier.value = _isVibrationEnabled;
  }

  Future<void> toggleVibration() async {
    _isVibrationEnabled = !_isVibrationEnabled;
    vibrationNotifier.value = _isVibrationEnabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('vibration_enabled', _isVibrationEnabled);
    if (_isVibrationEnabled) {
      await HapticFeedback.mediumImpact();
    }
  }

  Future<void> lightImpact() async {
    if (_isVibrationEnabled) {
      await HapticFeedback.lightImpact();
    }
  }

  Future<void> mediumImpact() async {
    if (_isVibrationEnabled) {
      await HapticFeedback.mediumImpact();
    }
  }

  Future<void> heavyImpact() async {
    if (_isVibrationEnabled) {
      await HapticFeedback.heavyImpact();
    }
  }

  Future<void> selectionClick() async {
    if (_isVibrationEnabled) {
      await HapticFeedback.selectionClick();
    }
  }

  Future<void> vibrate() async {
    if (_isVibrationEnabled) {
      await HapticFeedback.vibrate();
    }
  }
}
