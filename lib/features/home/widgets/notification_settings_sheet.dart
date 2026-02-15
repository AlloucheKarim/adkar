import 'package:flutter/material.dart';
import 'package:adhkars_app/core/notification_service.dart';
import 'package:adhkars_app/core/design_system.dart';
import 'package:adhkars_app/core/theme_service.dart';

class NotificationSettingsSheet extends StatelessWidget {
  const NotificationSettingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([NotificationService(), ThemeService()]),
      builder: (context, _) {
        final service = NotificationService();
        final isNightMode = ThemeService().isNightMode;

        final bgColor = isNightMode
            ? const Color(0xFF2D1F1A)
            : const Color(0xFFFFF8E1);
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        final accentColor = const Color(0xFFE6C98A);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: accentColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'إِعْدَادَات التَّنْبِيهَات',
                style: AppTypography.thuluth(
                  fontSize: 24,
                ).copyWith(color: primaryColor),
              ),
              const SizedBox(height: 32),
              _buildToggleItem(
                title: 'أَذْكَار الصَّبَاح وَالْمَسَاء',
                value: service.isAdhkarsEnabled,
                onChanged: (_) => service.toggleAdhkars(),
                icon: Icons.wb_twilight_outlined,
                isNightMode: isNightMode,
              ),
              Divider(height: 32, color: accentColor.withValues(alpha: 0.2)),
              _buildToggleItem(
                title: 'مَوَاقِيت الصَّلَاة',
                value: service.isPrayersEnabled,
                onChanged: (_) => service.togglePrayers(),
                icon: Icons.mosque_outlined,
                isNightMode: isNightMode,
              ),
              Divider(height: 32, color: accentColor.withValues(alpha: 0.2)),
              _buildToggleItem(
                title: 'نَفَحَات قُرْآنِيَّة',
                value: service.isNafahatEnabled,
                onChanged: (_) => service.toggleNafahat(),
                icon: Icons.auto_awesome_outlined,
                isNightMode: isNightMode,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToggleItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
    required bool isNightMode,
  }) {
    final primaryColor = isNightMode
        ? const Color(0xFFF5F5DC)
        : const Color(0xFF5D4037);
    final accentColor = const Color(0xFFE6C98A);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: accentColor.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: accentColor, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: AppTypography.scheherazade(
              fontSize: 20,
              color: primaryColor,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: accentColor,
          activeTrackColor: accentColor.withValues(alpha: 0.3),
        ),
      ],
    );
  }
}
