import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:adhan/adhan.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerService extends ChangeNotifier {
  static final PrayerService _instance = PrayerService._internal();
  factory PrayerService() => _instance;
  PrayerService._internal();

  PrayerTimes? _prayerTimes;
  Position? _position;
  bool _isLoading = false;
  String? _errorMessage;
  Timer? _refreshTimer;

  // Getters
  PrayerTimes? get prayerTimes => _prayerTimes;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasData => _prayerTimes != null;

  // Prayer names in Arabic
  static const Map<Prayer, String> prayerNames = {
    Prayer.fajr: 'الفجر',
    Prayer.sunrise: 'الشروق',
    Prayer.dhuhr: 'الظهر',
    Prayer.asr: 'العصر',
    Prayer.maghrib: 'المغرب',
    Prayer.isha: 'العشاء',
  };

  // Get next prayer and time remaining
  Prayer? get nextPrayer {
    if (_prayerTimes == null) return null;
    return _prayerTimes!.nextPrayer();
  }

  String get nextPrayerName {
    final next = nextPrayer;
    if (next == null || next == Prayer.none) return '';
    return prayerNames[next] ?? '';
  }

  DateTime? get nextPrayerTime {
    if (_prayerTimes == null || nextPrayer == null) return null;
    return _prayerTimes!.timeForPrayer(nextPrayer!);
  }

  Duration? get timeUntilNextPrayer {
    final nextTime = nextPrayerTime;
    if (nextTime == null) return null;
    final now = DateTime.now();
    if (nextTime.isBefore(now)) return null;
    return nextTime.difference(now);
  }

  String get formattedTimeUntilNextPrayer {
    final duration = timeUntilNextPrayer;
    if (duration == null) return '';

    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);

    if (hours > 0) {
      return '$hours س $minutes د';
    }
    return '$minutes دقيقة';
  }

  // Initialize service
  Future<void> initialize() async {
    if (_prayerTimes != null) return; // Already initialized
    await _loadCachedLocation();
    await fetchPrayerTimes();
    _setupRefreshTimer();
  }

  // Load cached location from SharedPreferences
  Future<void> _loadCachedLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final lat = prefs.getDouble('prayer_lat');
    final lng = prefs.getDouble('prayer_lng');
    if (lat != null && lng != null) {
      // Use cached location for initial calculation
      _calculatePrayerTimes(lat, lng);
    }
  }

  // Fetch current location and calculate prayer times
  Future<void> fetchPrayerTimes() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _errorMessage = 'الرجاء السماح بالوصول إلى الموقع';
          _isLoading = false;
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _errorMessage = 'الموقع محظور. يرجى تفعيله من الإعدادات';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Get current position
      _position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.low,
          timeLimit: Duration(seconds: 10),
        ),
      );

      // Cache location
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('prayer_lat', _position!.latitude);
      await prefs.setDouble('prayer_lng', _position!.longitude);

      // Calculate prayer times
      _calculatePrayerTimes(_position!.latitude, _position!.longitude);
    } catch (e) {
      _errorMessage = 'تعذر الحصول على الموقع';
      debugPrint('Prayer times error: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  void _calculatePrayerTimes(double latitude, double longitude) {
    final coordinates = Coordinates(latitude, longitude);
    final params = CalculationMethod.muslim_world_league.getParameters();
    params.madhab = Madhab.shafi; // Can be made configurable

    final date = DateComponents.from(DateTime.now());
    _prayerTimes = PrayerTimes(coordinates, date, params);
  }

  // Get time for a specific prayer
  DateTime? getTimeForPrayer(Prayer prayer) {
    return _prayerTimes?.timeForPrayer(prayer);
  }

  // Format prayer time as HH:mm
  String formatPrayerTime(Prayer prayer) {
    final time = getTimeForPrayer(prayer);
    if (time == null) return '--:--';
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  // Setup timer to refresh at midnight or when prayer passes
  void _setupRefreshTimer() {
    _refreshTimer?.cancel();

    // Refresh every minute to update countdown
    _refreshTimer = Timer.periodic(const Duration(minutes: 1), (_) {
      notifyListeners(); // Update countdown display

      // Check if we need to recalculate (new day)
      final now = DateTime.now();
      if (now.hour == 0 && now.minute == 0) {
        fetchPrayerTimes();
      }
    });
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }
}
