import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformUtils {
  static const String androidStoreUrl =
      'https://play.google.com/store/apps/details?id=com.adhkars.app.adhkars_app';
  static const String iosStoreUrl = 'https://apps.apple.com/fr/app/adhkar-elmuslima-%D8%A3%D8%B0%D9%83%D8%A7%D8%B1-%D8%A7%D9%84%D9%85%D8%B3%D9%84%D9%85%D8%A9/id6797849481';

  static String get currentStoreUrl {
    if (kIsWeb) return androidStoreUrl; // Fallback to Play Store on Web
    if (Platform.isAndroid) return androidStoreUrl;
    if (Platform.isIOS) return iosStoreUrl;
    return androidStoreUrl;
  }

  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}
