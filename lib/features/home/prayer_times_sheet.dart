import 'package:flutter/material.dart';
import '../../core/utils.dart';
import 'package:adhan/adhan.dart';
import '../../core/design_system.dart';
import '../../core/prayer_service.dart';
import '../../core/theme_service.dart';

class PrayerTimesSheet extends StatelessWidget {
  const PrayerTimesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([PrayerService(), ThemeService()]),
      builder: (context, _) {
        final prayerService = PrayerService();
        final isNightMode = ThemeService().isNightMode;

        final bgColor = isNightMode
            ? const Color(0xFF2D1F1A)
            : const Color(0xFFFFF8E1);
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        final accentColor = const Color(0xFFE6C98A);

        return Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              // Title
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'مَوَاقِيت الصَّلَاة'.preventOrphan(),
                  style: AppTypography.thuluth(
                    fontSize: 24,
                  ).copyWith(color: primaryColor),
                ),
              ),

              if (prayerService.isLoading)
                Padding(
                  padding: const EdgeInsets.all(40),
                  child: CircularProgressIndicator(color: accentColor),
                )
              else if (prayerService.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(Icons.location_off, color: accentColor, size: 48),
                      const SizedBox(height: 12),
                      Text(
                        prayerService.errorMessage!,
                        style: AppTypography.arabic(
                          fontSize: 16,
                        ).copyWith(color: primaryColor),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => prayerService.fetchPrayerTimes(),
                        icon: const Icon(Icons.refresh),
                        label: Text('إِعَادَةُ الْمُحَاوَلَةِ'.preventOrphan()),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accentColor,
                          foregroundColor: const Color(0xFF5D4037),
                        ),
                      ),
                    ],
                  ),
                )
              else if (prayerService.hasData)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      _PrayerRow(prayer: Prayer.fajr, isNightMode: isNightMode),
                      _PrayerRow(
                        prayer: Prayer.sunrise,
                        isNightMode: isNightMode,
                      ),
                      _PrayerRow(
                        prayer: Prayer.dhuhr,
                        isNightMode: isNightMode,
                      ),
                      _PrayerRow(prayer: Prayer.asr, isNightMode: isNightMode),
                      _PrayerRow(
                        prayer: Prayer.maghrib,
                        isNightMode: isNightMode,
                      ),
                      _PrayerRow(prayer: Prayer.isha, isNightMode: isNightMode),
                    ],
                  ),
                ),

              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}

class _PrayerRow extends StatelessWidget {
  final Prayer prayer;
  final bool isNightMode;

  const _PrayerRow({required this.prayer, required this.isNightMode});

  @override
  Widget build(BuildContext context) {
    final prayerService = PrayerService();
    final isNext = prayerService.nextPrayer == prayer;

    final primaryColor = isNightMode
        ? const Color(0xFFF5F5DC)
        : const Color(0xFF5D4037);
    final accentColor = const Color(0xFFE6C98A);
    final highlightColor = isNightMode
        ? const Color(0xFF4E342E)
        : const Color(0xFFFFECB3);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isNext ? highlightColor : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: isNext ? Border.all(color: accentColor, width: 1.5) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (isNext)
                Icon(Icons.arrow_back_ios, size: 14, color: accentColor),
              const SizedBox(width: 8),
              Text(
                PrayerService.prayerNames[prayer] ?? '',
                style: AppTypography.scheherazade(fontSize: 20).copyWith(
                  color: isNext ? accentColor : primaryColor,
                  fontWeight: isNext ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
          Text(
            prayerService.formatPrayerTime(prayer),
            style: AppTypography.header(
              fontSize: 18,
            ).copyWith(color: isNext ? accentColor : primaryColor),
          ),
        ],
      ),
    );
  }
}
