import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/models.dart';
import '../../core/repository.dart';
import '../../shared/scaffold_with_background.dart';
import '../../core/theme_service.dart';

class EmotionDetailScreen extends StatelessWidget {
  final String emotionTag;
  final String emotionLabel;

  const EmotionDetailScreen({
    super.key,
    required this.emotionTag,
    required this.emotionLabel,
  });

  @override
  Widget build(BuildContext context) {
    final duas = DhikrRepository.getByEmotion(emotionTag);

    return ScaffoldWithBackground(
      appBar: AppBar(
        title: Text(
          emotionLabel,
          style: AppTypography.arabic(fontSize: 24).copyWith(
            color: ThemeService().isNightMode
                ? const Color(0xFFF5F5DC)
                : const Color(0xFF5D4037),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: BackButton(
          color: ThemeService().isNightMode
              ? const Color(0xFFF5F5DC)
              : const Color(0xFF5D4037),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: duas.length,
          itemBuilder: (context, index) {
            final dua = duas[index];
            return _DuaCard(dua: dua);
          },
        ),
      ),
    );
  }
}

class _DuaCard extends StatelessWidget {
  final Dhikr dua;

  const _DuaCard({required this.dua});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        final secondaryColor = isNightMode
            ? const Color(0xFFE6C98A)
            : const Color(0xFF8D6E63);

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.fromLTRB(40, 50, 40, 40),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isNightMode
                    ? 'assets/images/doua_frame-night.png'
                    : 'assets/images/header_frame_a.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Text(
                dua.arabicText,
                textAlign: TextAlign.center,
                style: AppTypography.arabic(
                  fontSize: 20,
                ).copyWith(color: primaryColor, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 12),
              Text(
                dua.virtue,
                textAlign: TextAlign.center,
                style: AppTypography.arabic(
                  fontSize: 14,
                ).copyWith(color: secondaryColor, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 8),
              Text(
                '— ${dua.sourceRef}',
                style: AppTypography.arabic(
                  fontSize: 11,
                ).copyWith(color: secondaryColor.withValues(alpha: 0.6)),
              ),
            ],
          ),
        );
      },
    );
  }
}
