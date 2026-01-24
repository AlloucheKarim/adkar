import 'package:flutter/material.dart';
import '../../../core/design_system.dart';
import '../../../core/gratitude_service.dart';
import '../../../core/transitions.dart';
import '../gratitude_screen.dart';

class GratitudeCorner extends StatelessWidget {
  final bool isNightMode;
  const GratitudeCorner({super.key, this.isNightMode = false});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GratitudeService(),
      builder: (context, child) {
        final latest = GratitudeService().latestEntry;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isNightMode
                ? Colors.transparent
                : Colors.white.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE6C98A).withValues(alpha: 0.3),
            ),
            boxShadow: isNightMode ? null : AppColors.premiumShadow,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Color(0xFFF4C6D7),
                    size: 20,
                  ),
                  Text(
                    'ركن الامتنان',
                    style: AppTypography.header(fontSize: 22).copyWith(
                      color: isNightMode
                          ? const Color(0xFFF5F5DC)
                          : const Color(0xFF5D4037),
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Color(0xFFF4C6D7),
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (latest != null)
                Text(
                  '"${latest.content}"',
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
                  'ما هي النعمة التي تودين شكر الله عليها اليوم؟',
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
                  latest != null ? 'تحديث خاطرتكِ' : 'اكتبي خاطرتكِ',
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
