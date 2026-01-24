import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhkars_app/core/prayer_service.dart';
import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';

class NotificationService extends ChangeNotifier {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  bool _isEnabled = true;
  bool _isInitialized = false;

  bool get isEnabled => _isEnabled;

  Future<void> initialize() async {
    if (kIsWeb) return;

    try {
      initializeTimeZones();

      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings iosSettings =
          DarwinInitializationSettings(
            requestAlertPermission: true,
            requestBadgePermission: true,
            requestSoundPermission: true,
          );

      const InitializationSettings settings = InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      );

      await _notifications.initialize(settings);
      _isInitialized = true;

      final prefs = await SharedPreferences.getInstance();
      _isEnabled = prefs.getBool('notifications_enabled') ?? true;

      // Listen to prayer service updates
      PrayerService().addListener(() {
        if (_isEnabled) scheduleAdhkars();
      });

      if (_isEnabled) {
        await scheduleAdhkars();
      }
    } catch (e) {
      debugPrint('Notification initialization failed: $e');
      _isInitialized = false;
    }
  }

  Future<void> toggleNotifications() async {
    _isEnabled = !_isEnabled;
    notifyListeners(); // Immediate UI update

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', _isEnabled);

    if (_isEnabled) {
      await scheduleAdhkars();
    } else if (_isInitialized) {
      try {
        await _notifications.cancelAll();
      } catch (e) {
        debugPrint('Failed to cancel notifications: $e');
      }
    }
  }

  Future<void> scheduleAdhkars() async {
    if (!_isEnabled || !_isInitialized) return;

    try {
      await _notifications.cancelAll();

      final prayerService = PrayerService();
      if (!prayerService.hasData) return;

      final fajr = prayerService.getTimeForPrayer(Prayer.fajr);
      final asr = prayerService.getTimeForPrayer(Prayer.asr);

      if (fajr != null) {
        final morningTime = fajr.add(const Duration(minutes: 30));
        if (morningTime.isAfter(DateTime.now())) {
          await _scheduleNotification(
            id: 1,
            title: 'أذكار الصباح',
            body: 'حان وقت أذكار الصباح، نوري يومكِ بذكر الله 🌸',
            scheduledDate: morningTime,
          );
        }
      }

      if (asr != null) {
        final eveningTime = asr.add(const Duration(minutes: 30));
        if (eveningTime.isAfter(DateTime.now())) {
          await _scheduleNotification(
            id: 2,
            title: 'أذكار المساء',
            body: 'حان وقت أذكار المساء، طمأني قلبكِ بذكر الله ✨',
            scheduledDate: eveningTime,
          );
        }
      }
    } catch (e) {
      debugPrint('Failed to schedule notifications: $e');
    }
  }

  Future<void> _scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledDate,
  }) async {
    await _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'adhkar_reminders',
          'Reminders',
          channelDescription: 'Daily Adhkar Reminders',
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time, // Repeat daily
    );
  }
}
