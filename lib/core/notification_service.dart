import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:adhkars_app/core/prayer_service.dart';
import 'package:adhan/adhan.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show TimeOfDay;

class NotificationService extends ChangeNotifier {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  bool _isAdhkarsEnabled = true;
  bool _isPrayersEnabled = true;
  bool _isNafahatEnabled = true;
  bool _isInitialized = false;

  bool get isAdhkarsEnabled => _isAdhkarsEnabled;
  bool get isPrayersEnabled => _isPrayersEnabled;
  bool get isNafahatEnabled => _isNafahatEnabled;
  bool get isEnabled =>
      _isAdhkarsEnabled || _isPrayersEnabled || _isNafahatEnabled;

  Future<void> initialize() async {
    if (kIsWeb) return;

    try {
      initializeTimeZones();

      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/launcher_icon');
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
      debugPrint('NotificationService: Plugin initialized successfully');
      _isInitialized = true;

      final prefs = await SharedPreferences.getInstance();
      _isAdhkarsEnabled =
          prefs.getBool('notifications_adhkars_enabled') ?? true;
      _isPrayersEnabled =
          prefs.getBool('notifications_prayers_enabled') ?? true;
      _isNafahatEnabled =
          prefs.getBool('notifications_nafahat_enabled') ?? true;

      // Listen to prayer service updates
      PrayerService().addListener(() {
        scheduleAdhkars();
      });

      await requestPermissions();
      await scheduleAdhkars();
    } catch (e) {
      debugPrint('Notification initialization failed: $e');
      _isInitialized = false;
    }
  }

  Future<void> toggleAdhkars() async {
    _isAdhkarsEnabled = !_isAdhkarsEnabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_adhkars_enabled', _isAdhkarsEnabled);
    await scheduleAdhkars();
  }

  Future<void> togglePrayers() async {
    _isPrayersEnabled = !_isPrayersEnabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_prayers_enabled', _isPrayersEnabled);
    await scheduleAdhkars();
  }

  Future<void> toggleNafahat() async {
    _isNafahatEnabled = !_isNafahatEnabled;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_nafahat_enabled', _isNafahatEnabled);
    await scheduleAdhkars();
  }

  Future<void> toggleNotifications() async {
    // If anything is enabled, disable everything. If everything is disabled, enable everything.
    final target = !isEnabled;
    _isAdhkarsEnabled = target;
    _isPrayersEnabled = target;
    _isNafahatEnabled = target;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_adhkars_enabled', target);
    await prefs.setBool('notifications_prayers_enabled', target);
    await prefs.setBool('notifications_nafahat_enabled', target);

    await scheduleAdhkars();
  }

  Future<void> scheduleAdhkars() async {
    if (!_isInitialized) return;

    try {
      await _notifications.cancelAll();

      if (!isEnabled) return;

      final prayerService = PrayerService();
      if (!prayerService.hasData) return;

      final now = DateTime.now();

      // 1. Adhkars
      if (_isAdhkarsEnabled) {
        final fajrTime = prayerService.getTimeForPrayer(Prayer.fajr);
        final asrTime = prayerService.getTimeForPrayer(Prayer.asr);

        if (fajrTime != null) {
          final morningTime = fajrTime.add(const Duration(minutes: 30));
          await _scheduleNotification(
            id: 1,
            title: 'أَذْكَارُ الصَّبَاحِ',
            body:
                'حَانَ وَقْتُ أَذْكَارِ الصَّبَاحِ، نَوِّرِي يَوْمَكِ بِذِكْرِ اللَّهِ 🌸',
            scheduledDate: morningTime,
          );
        }

        if (asrTime != null) {
          final eveningTime = asrTime.add(const Duration(minutes: 30));
          await _scheduleNotification(
            id: 2,
            title: 'أَذْكَارُ الْمَسَاءِ',
            body:
                'حَانَ وَقْتُ أَذْكَارِ الْمَسَاءِ، طَمْأَنِي قَلْبَكِ بِذِكْرِ اللَّهِ ✨',
            scheduledDate: eveningTime,
          );
        }
      }

      // 2. Daily Prayers
      if (_isPrayersEnabled) {
        final prayerReminders = [
          {
            'id': 10,
            'prayer': Prayer.fajr,
            'title': 'نِدَاءُ الْفَجْرِ',
            'body':
                'قُومِي لِلِقَاءِ رَبِّكِ، الصَّلَاةُ خَيْرٌ مِنَ النَّوْمِ يَا غَالِيَتِي 🕊️',
          },
          {
            'id': 11,
            'prayer': Prayer.dhuhr,
            'title': 'صَلَاةُ الظُّهْرِ',
            'body':
                'اِسْتَرِيحِي مِنْ عَنَاءِ الدُّنْيَا وَجَدِّدِي رُوحَكِ بَيْنَ يَدَيِ اللَّهِ ✨',
          },
          {
            'id': 12,
            'prayer': Prayer.asr,
            'title': 'صَلَاةُ الْعَصْرِ',
            'body':
                'حَانَ وَقْتُ الْعَصْرِ، لَا تَنْسَيْ نَصِيبَكِ مِنَ الطُّمَأْنِينَةِ رَفِيقَتِي 🌸',
          },
          {
            'id': 13,
            'prayer': Prayer.maghrib,
            'title': 'صَلَاةُ الْمَغْرِبِ',
            'body':
                'اِخْتِمِي نَهَارَكِ بِالْجَمَالِ وَالشُّكْرِ، مَوْعِدُ الْمَغْرِبِ قَدْ حَانَ 🌙',
          },
          {
            'id': 14,
            'prayer': Prayer.isha,
            'title': 'صَلَاةُ الْعِشَاءِ',
            'body':
                'قَبْلَ أَنْ تَنَامِي، أَوْدِعِي قَلْبَكِ عِنْدَ اللَّهِ فِي صَلَاةِ الْعِشَاءِ 🕯️',
          },
        ];

        for (final reminder in prayerReminders) {
          final time = prayerService.getTimeForPrayer(
            reminder['prayer'] as Prayer,
          );
          if (time != null) {
            await _scheduleNotification(
              id: reminder['id'] as int,
              title: reminder['title'] as String,
              body: reminder['body'] as String,
              scheduledDate: time,
            );
          }
        }
      }

      // 3. Nafahat (Quranic Duas)
      if (_isNafahatEnabled) {
        await _scheduleNafahat(now);
      }
    } catch (e) {
      debugPrint('Failed to schedule notifications: $e');
    }
  }

  Future<void> _scheduleNafahat(DateTime now) async {
    final nafahat = [
      {
        'title': 'نَفَحَاتٌ لِقَلْبِكِ 🕊️',
        'body': 'رَبِّ اشْرَحْ لِي صَدْرِي وَيَسِّرْ لِي أَمْرِي',
      },
      {
        'title': 'هَمْسَةٌ إِيمَانِيَّةٌ ✨',
        'body':
            'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الآخِرَةِ حَسَنَةً',
      },
      {
        'title': 'سَجْدَةُ شُكْرٍ 🌸',
        'body': 'رَبِّ اجْعَلْنِي مُقِيمَ الصَّلاةِ وَمِن ذُرِّيَّتِي',
      },
      {
        'title': 'نُورٌ لِدَرْبِكِ 🕯️',
        'body':
            'رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ',
      },
      {
        'title': 'طُمَأْنِينَةُ الرُّوحِ 🌿',
        'body': 'رَبَّنَا لا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا',
      },
      {
        'title': 'ذِكْرٌ وَدُعَاءٌ 📖',
        'body':
            'رَبَّنَا آتِنَا مِن لَّدُنكَ رَحْمَةً وَهَيِّئْ لَنَا مِنْ أَمْرِنَا رَشَدًا',
      },
      {
        'title': 'طَلَبُ الْمَغْفِرَةِ 🤲',
        'body': 'رَبِّ اغْفِرْ وَارْحَمْ وَأَنْتَ خَيْرُ الرَّاحِمِينَ',
      },
    ];

    // Schedule 5 random nafahat at regular intervals
    final times = [
      const TimeOfDay(hour: 9, minute: 0),
      const TimeOfDay(hour: 12, minute: 0),
      const TimeOfDay(hour: 15, minute: 0),
      const TimeOfDay(hour: 18, minute: 0),
      const TimeOfDay(hour: 21, minute: 0),
    ];

    for (int i = 0; i < times.length; i++) {
      final scheduledTime = DateTime(
        now.year,
        now.month,
        now.day,
        times[i].hour,
        times[i].minute,
      );

      // Select a random dua using the loop index for better distribution
      final dua = nafahat[(now.minute + i) % nafahat.length];
      await _scheduleNotification(
        id: 100 + i, // IDs 100, 101, 102, 103, 104
        title: dua['body']!, // Dua in the title
        body: '', // Empty body as requested
        scheduledDate: scheduledTime,
      );
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
          showWhen: true,
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
    debugPrint(
      'NotificationService: Scheduled notification $id at $scheduledDate',
    );
  }

  Future<void> requestPermissions() async {
    if (kIsWeb) return;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      await _notifications
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      await _notifications
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();
    }
  }
}
