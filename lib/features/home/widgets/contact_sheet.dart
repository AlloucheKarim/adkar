import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/design_system.dart';
import '../../../core/theme_service.dart';
import 'home_widgets_utils.dart';

class ContactSheet extends StatelessWidget {
  const ContactSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final isNightMode = ThemeService().isNightMode;
    final bgColor = isNightMode
        ? const Color(0xFF4E342E)
        : const Color(0xFFFFF8E1);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        border: Border.all(color: const Color(0xFFE6C98A), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFE6C98A).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'يسعدنا تواصلكِ عبر البريد الإلكتروني:',
            textAlign: TextAlign.center,
            style: AppTypography.arabic(fontSize: 18).copyWith(
              color: const Color(0xFFC09D63),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          LinkRow(
            link: 'contact.adhkarelmuslima@gmail.com',
            icon: Icons.email_outlined,
            isCentered: true,
            onCopy: () {
              Clipboard.setData(
                const ClipboardData(text: 'contact.adhkarelmuslima@gmail.com'),
              );
              final bgColor = isNightMode
                  ? const Color(0xFF4E342E)
                  : const Color(0xFFFAE8EE);
              final textColor = isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF8D6E63);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'تم نسخ البريد الإلكتروني بنجاح',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'NotoNaskhArabic',
                    ),
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: bgColor,
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height - 100,
                    left: 20,
                    right: 20,
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            isNightMode: isNightMode,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
