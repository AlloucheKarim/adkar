import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/models.dart';
import '../../core/theme_service.dart';
import '../../shared/scaffold_with_background.dart';

class DhikrDetailScreen extends StatelessWidget {
  final Dhikr dhikr;

  const DhikrDetailScreen({super.key, required this.dhikr});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        final cardColor = isNightMode
            ? const Color(0xFF4E342E).withValues(alpha: 0.6)
            : const Color(0xFFFFF8E1).withValues(alpha: 0.8);

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text(
              'فضل الذكر',
              style: AppTypography.header(
                fontSize: 24,
              ).copyWith(color: primaryColor),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            leading: BackButton(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Preuve / Dalil (هديٌ نستنير به)
                _SectionHeader(
                  title: 'هديٌ نستنير به',
                  icon: Icons.auto_awesome,
                  isNightMode: isNightMode,
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColors.accent.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dhikr.sourceText,
                        style: AppTypography.arabic(fontSize: 16).copyWith(
                          fontStyle: FontStyle.italic,
                          color: primaryColor,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            dhikr.sourceRef,
                            style: AppTypography.arabic(fontSize: 14).copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.accent,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // 2. Pourquoi + Bénéfice (ثماره في حياتك)
                _SectionHeader(
                  title: 'ثماره في حياتك',
                  icon: Icons.volunteer_activism,
                  isNightMode: isNightMode,
                ),
                const SizedBox(height: 16),
                _InfoBox(
                  text: dhikr.virtue,
                  color: isNightMode
                      ? AppColors.accent.withValues(alpha: 0.1)
                      : AppColors.primary.withValues(alpha: 0.15),
                  textColor: primaryColor,
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isNightMode;

  const _SectionHeader({
    required this.title,
    required this.icon,
    required this.isNightMode,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 22, color: AppColors.accent),
        const SizedBox(width: 10),
        Text(
          title,
          style: AppTypography.arabic(fontSize: 20).copyWith(
            fontWeight: FontWeight.w800,
            color: isNightMode
                ? const Color(0xFFF5F5DC)
                : const Color(0xFF5D4037),
          ),
        ),
      ],
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const _InfoBox({
    required this.text,
    required this.color,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: AppTypography.arabic(
          fontSize: 18,
        ).copyWith(fontWeight: FontWeight.w500, color: textColor),
      ),
    );
  }
}
