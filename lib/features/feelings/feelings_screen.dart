import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/transitions.dart';
import '../../shared/scaffold_with_background.dart';
import 'emotion_detail_screen.dart';
import '../../core/theme_service.dart';

class FeelingsScreen extends StatelessWidget {
  const FeelingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> emotions = [
      {'tag': 'sad', 'label': 'حزينة', 'icon': 'assets/images/emotion_sad.png', 'color': const Color(0xFFE1BEE7)},
      {'tag': 'anxious', 'label': 'قلقة', 'icon': 'assets/images/emotion_anxious.png', 'color': const Color(0xFFC8E6C9)}, // Light Green
      {'tag': 'happy', 'label': 'سعيدة', 'icon': 'assets/images/emotion_happy.png', 'color': const Color(0xFFFFF9C4)},
      {'tag': 'tired', 'label': 'متعبة', 'icon': 'assets/images/emotion_tired.png', 'color': const Color(0xFFB2EBF2)},
      {'tag': 'lost', 'label': 'تائهة', 'icon': 'assets/images/emotion_lost.png', 'color': const Color(0xFFF8BBD0)}, // Light Pink
      {'tag': 'angry', 'label': 'غاضبة', 'icon': 'assets/images/emotion_angry.png', 'color': const Color(0xFFFFCDD2)},
    ];

    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final primaryColor = isNightMode ? const Color(0xFFF5F5DC) : const Color(0xFF5D4037);
        final secondaryColor = isNightMode ? const Color(0xFFE6C98A) : const Color(0xFF8D6E63);

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text('لحظة مع مشاعركِ', style: AppTypography.header(fontSize: 24).copyWith(color: primaryColor)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              color: isNightMode ? const Color(0xFFF5F5DC) : const Color(0xFF5D4037),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    'كيف حال قلبكِ اليوم؟ اختاري ما تشعرين به لنبحث لكِ عن السكينة في كلمات الله...',
                    textAlign: TextAlign.center,
                    style: AppTypography.arabic(fontSize: 18).copyWith(
                      color: secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      // Calculate spacing and sizes to fit everything in one page
                      const double horizontalPadding = 30;
                      const double crossAxisSpacing = 20;
                      const double mainAxisSpacing = 20;
                      final double gridWidth = constraints.maxWidth - (horizontalPadding * 2);
                      final double gridHeight = constraints.maxHeight - 20; // 20 for bottom padding

                      final double itemWidth = (gridWidth - crossAxisSpacing) / 2;
                      final itemHeight = (gridHeight - (mainAxisSpacing * 2)) / 3;
                      
                      final double childAspectRatio = itemWidth / itemHeight;

                      return GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                        physics: const NeverScrollableScrollPhysics(), // Prevent scrolling
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: crossAxisSpacing,
                          mainAxisSpacing: mainAxisSpacing,
                          childAspectRatio: childAspectRatio,
                        ),
                        itemCount: emotions.length,
                        itemBuilder: (context, index) {
                          final emotion = emotions[index];
                          return _EmotionCard(
                            label: emotion['label'],
                            icon: emotion['icon'],
                            color: emotion['color'],
                            isNightMode: isNightMode,
                            onTap: () => Navigator.push(
                              context,
                              BookPageRoute(
                                page: EmotionDetailScreen(
                                  emotionTag: emotion['tag'],
                                  emotionLabel: emotion['label'],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmotionCard extends StatelessWidget {
  final String label;
  final String icon;
  final Color color;
  final VoidCallback onTap;
  final bool isNightMode;

  const _EmotionCard({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
    this.isNightMode = false,
  });

  @override
  Widget build(BuildContext context) {
        return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          color: isNightMode 
              ? color.withValues(alpha: 0.1) // Darker/more transparent for night
              : color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: isNightMode
                ? color.withValues(alpha: 0.3)
                : color.withValues(alpha: 0.4),
            width: 2
          ),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon.startsWith('assets/')
                ? Image.asset(
                    icon,
                    width: 70,
                    height: 70,
                    fit: BoxFit.contain,
                  )
                : Text(
                    icon,
                    style: const TextStyle(fontSize: 45),
                  ),
            const SizedBox(height: 12),
            Text(
              label,
              style: AppTypography.header(fontSize: 20).copyWith(
                color: isNightMode ? const Color(0xFFF5F5DC) : const Color(0xFF5D4037),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
