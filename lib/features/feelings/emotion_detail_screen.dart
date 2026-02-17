import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/design_system.dart';
import '../../core/models.dart';
import '../../core/repository.dart';
import '../../shared/scaffold_with_background.dart';
import '../../core/theme_service.dart';
import '../../core/transitions.dart';
import '../../core/utils.dart';
import '../dhikr_detail/dhikr_detail_screen.dart';

class EmotionDetailScreen extends StatelessWidget {
  final String emotionTag;
  final String emotionLabel;

  const EmotionDetailScreen({
    super.key,
    required emotionTag,
    required emotionLabel,
  }) : emotionTag = emotionTag,
       emotionLabel = emotionLabel;

  @override
  Widget build(BuildContext context) {
    final adhkars = DhikrRepository.getByEmotion(emotionTag);

    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text(
              emotionLabel.preventOrphan(),
              style: AppTypography.header(
                fontSize: 24,
              ).copyWith(color: primaryColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(color: primaryColor),
          ),
          body: SafeArea(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: adhkars.length,
              itemBuilder: (context, index) {
                final dhikr = adhkars[index];
                return _DuaCard(dhikr: dhikr);
              },
            ),
          ),
        );
      },
    );
  }
}

enum LanguageMode { arabic, english, french }

class _DuaCard extends StatefulWidget {
  final Dhikr dhikr;

  const _DuaCard({required this.dhikr});

  @override
  State<_DuaCard> createState() => _DuaCardState();
}

class _DuaCardState extends State<_DuaCard> {
  LanguageMode languageMode = LanguageMode.arabic;

  void _toggleLanguage() {
    setState(() {
      if (languageMode == LanguageMode.arabic) {
        languageMode = LanguageMode.english;
      } else if (languageMode == LanguageMode.english) {
        languageMode = LanguageMode.french;
      } else {
        languageMode = LanguageMode.arabic;
      }
    });
    // Haptic removed
  }

  String _getDisplayText() {
    switch (languageMode) {
      case LanguageMode.english:
        return widget.dhikr.englishText;
      case LanguageMode.french:
        return widget.dhikr.frenchText;
      case LanguageMode.arabic:
        return widget.dhikr.arabicText.preventOrphan();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final textColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        const accentColor = Color(0xFFE6C98A);

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isNightMode
                    ? 'assets/images/dhikr_frame_night.png'
                    : 'assets/images/dhikr_frame_day.png',
              ),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _getDisplayText(),
                  textAlign: TextAlign.center,
                  style:
                      (languageMode == LanguageMode.arabic
                              ? AppTypography.arabic(fontSize: 22)
                              : AppTypography.uiBody(fontSize: 16))
                          .copyWith(
                            color: textColor,
                            height: languageMode == LanguageMode.arabic
                                ? 1.5
                                : 1.3,
                          ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Fadl Dua Button
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          BookPageRoute(
                            page: DhikrDetailScreen(dhikr: widget.dhikr),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: accentColor, width: 1.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'فَضْل الدُّعَاء',
                              style: AppTypography.arabic(fontSize: 12)
                                  .copyWith(
                                    color: isNightMode
                                        ? accentColor
                                        : const Color(0xFF8D6E63),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/book_details.png',
                              width: 22,
                              height: 22,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Translation Button
                    InkWell(
                      onTap: _toggleLanguage,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: accentColor, width: 1.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ترجمة',
                              style: AppTypography.arabic(fontSize: 12)
                                  .copyWith(
                                    color: isNightMode
                                        ? accentColor
                                        : const Color(0xFF8D6E63),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset(
                              'assets/images/translate_v2.png',
                              width: 22,
                              height: 22,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
