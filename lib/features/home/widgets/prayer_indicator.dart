import 'package:flutter/material.dart';
import '../../../core/design_system.dart';
import '../../../core/prayer_service.dart';
import '../prayer_times_sheet.dart';

class PrayerIndicator extends StatelessWidget {
  final bool isNightMode;

  const PrayerIndicator({super.key, required this.isNightMode});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: PrayerService(),
      builder: (context, _) {
        final prayerService = PrayerService();

        final bgColor = isNightMode
            ? const Color(0xFF4E342E).withValues(alpha: 0.7)
            : Colors.white.withValues(alpha: 0.7);
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        const accentColor = Color(0xFFE6C98A);

        // Don't show if no data and not loading
        if (!prayerService.hasData &&
            !prayerService.isLoading &&
            prayerService.errorMessage == null) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => const PrayerTimesSheet(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 18,
                  color: accentColor,
                ),
                const SizedBox(width: 8),
                if (prayerService.isLoading)
                  Text(
                    'جاري التحميل...',
                    style: AppTypography.arabic(
                      fontSize: 14,
                    ).copyWith(color: primaryColor.withValues(alpha: 0.7)),
                  )
                else if (prayerService.errorMessage != null)
                  Text(
                    'اضغطي لتحديد الموقع',
                    style: AppTypography.arabic(
                      fontSize: 14,
                    ).copyWith(color: primaryColor.withValues(alpha: 0.7)),
                  )
                else if (prayerService.hasData)
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: prayerService.nextPrayerName,
                          style: AppTypography.arabic(fontSize: 14).copyWith(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' بعد ',
                          style: AppTypography.arabic(
                            fontSize: 14,
                          ).copyWith(color: primaryColor),
                        ),
                        TextSpan(
                          text: prayerService.formattedTimeUntilNextPrayer,
                          style: AppTypography.arabic(fontSize: 14).copyWith(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: accentColor.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
