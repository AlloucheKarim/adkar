import 'package:flutter/material.dart';
import '../../core/utils.dart';
import '../../core/design_system.dart';
import '../../shared/scaffold_with_background.dart';
import '../../core/gratitude_service.dart';
import '../../core/theme_service.dart';

class GratitudeScreen extends StatefulWidget {
  const GratitudeScreen({super.key});

  @override
  State<GratitudeScreen> createState() => _GratitudeScreenState();
}

class _GratitudeScreenState extends State<GratitudeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = GratitudeService().getTodaysEntry()?.content ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _save() {
    if (_controller.text.trim().isNotEmpty) {
      GratitudeService().addEntry(_controller.text.trim());
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تَمَّ حِفْظُ خَاطِرَتِكِ بِنَجَاحٍ')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text(
              'رُكْنُ الِامْتِنَانِ'.preventOrphan(),
              style: AppTypography.header(fontSize: 24).copyWith(
                color: isNightMode
                    ? const Color(0xFFF5F5DC)
                    : const Color(0xFF5D4037),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  'لَئِن شَكَرْتُمْ لَأَزِيدَنَّكُمْ'.preventOrphan(),
                  textAlign: TextAlign.center,
                  style: AppTypography.arabic(fontSize: 20).copyWith(
                    color: isNightMode
                        ? const Color(0xFFF5F5DC)
                        : const Color(0xFF8D6E63),
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isNightMode
                          ? const Color(0xFF4E342E).withValues(alpha: 0.6)
                          : Colors.white.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: isNightMode ? null : AppColors.premiumShadow,
                    ),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      expands: true,
                      textAlign: TextAlign.center,
                      style: AppTypography.arabic(fontSize: 22).copyWith(
                        color: isNightMode
                            ? const Color(0xFFF5F5DC)
                            : AppColors.textPrimary,
                      ),
                      decoration: InputDecoration(
                        hintText: 'اكْتُبِي هُنَا...',
                        hintStyle: AppTypography.arabic(fontSize: 22).copyWith(
                          color: isNightMode
                              ? const Color(0xFFF5F5DC).withValues(alpha: 0.5)
                              : Colors.grey,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE6C98A),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'حِفْظٌ',
                    style: AppTypography.header(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
