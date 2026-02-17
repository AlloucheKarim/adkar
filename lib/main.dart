import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/theme.dart';
import 'features/onboarding/splash_screen.dart';
import 'core/prayer_service.dart';
import 'core/gratitude_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services in background to avoid blocking the Splash Screen
  PrayerService().initialize();
  GratitudeService().initialize();

  runApp(const AdhkarsApp());
}

class AdhkarsApp extends StatelessWidget {
  const AdhkarsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'أَذْكَارُ الْمُسْلِمَةِ',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('ar', '')],
      locale: const Locale('ar', ''),
      home: const SplashScreen(),
    );
  }
}
