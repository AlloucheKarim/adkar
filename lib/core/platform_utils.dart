import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

class PlatformUtils {
  static const String androidStoreUrl =
      'https://play.google.com/store/apps/details?id=com.adkar.app';
  static const String iosStoreUrl = 'https://apps.apple.com/app/id123456789';

  static String get currentStoreUrl {
    if (kIsWeb) return androidStoreUrl; // Fallback to Play Store on Web
    if (Platform.isAndroid) return androidStoreUrl;
    if (Platform.isIOS) return iosStoreUrl;
    return androidStoreUrl;
  }

  static bool get isMobile => !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}
