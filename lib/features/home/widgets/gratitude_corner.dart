import 'package:flutter/material.dart';
import '../../../core/design_system.dart';
import '../../../core/gratitude_service.dart';
import '../../../core/transitions.dart';
import '../../../core/utils.dart';
import '../gratitude_screen.dart';

class GratitudeCorner extends StatelessWidget {
  final bool isNightMode;
  const GratitudeCorner({super.key, this.isNightMode = false});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GratitudeService(),
      builder: (context, child) {
        final todaysEntry = GratitudeService().getTodaysEntry();

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: isNightMode
                ? const Color(0xFF4E342E).withValues(alpha: 0.4)
                : Colors.white.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: const Color(0xFFE6C98A).withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.auto_awesome,
                    color: Color(0xFFE6C98A),
                    size: 18,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'رُكْن الِامْتِنَان'.stripKasraFromShadda(),
                    style: AppTypography.thuluth(fontSize: 22).copyWith(
                      color: isNightMode
                          ? const Color(0xFFF5F5DC)
                          : const Color(0xFF5D4037),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.auto_awesome,
                    color: Color(0xFFE6C98A),
                    size: 18,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (todaysEntry != null)
                Text(
                  '"${todaysEntry.content.preventOrphan()}"',
                  textAlign: TextAlign.center,
                  style: AppTypography.arabic(fontSize: 18).copyWith(
                    color: isNightMode
                        ? const Color(0xFFE6C98A)
                        : const Color(0xFF8D6E63),
                    fontStyle: FontStyle.italic,
                  ),
                )
              else
                Text(
                  'مَا هِيَ النِّعْمَةُ الَّتِي تَوَدِّينَ شُكْرَ اللَّهِ عَلَيْهَا الْيَوْمَ؟'
                      .preventOrphan(),
                  textAlign: TextAlign.center,
                  style: AppTypography.arabic(fontSize: 16).copyWith(
                    color: isNightMode
                        ? const Color(0xFFF5F5DC).withValues(alpha: 0.9)
                        : const Color(0xFF8D6E63).withValues(alpha: 0.7),
                  ),
                ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  BookPageRoute(page: const GratitudeScreen()),
                ),
                icon: const Icon(Icons.edit_note, color: Color(0xFFC09D63)),
                label: Text(
                  todaysEntry != null
                      ? 'تَحْدِيث خَاطِرَتِك'
                      : 'اكْتُبِي خَاطِرَتِك',
                  style: AppTypography.header(
                    fontSize: 14,
                    color: const Color(0xFFC09D63),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
