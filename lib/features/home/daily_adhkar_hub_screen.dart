import 'package:flutter/material.dart';
import '../../core/design_system.dart';
import '../../core/models.dart';
import '../../core/repository.dart';
import '../../core/progress_service.dart';
import '../../shared/scaffold_with_background.dart';
import '../../core/transitions.dart';
import '../dhikr_list/dhikr_list_screen.dart';
import '../../core/theme_service.dart';

class DailyAdhkarHubScreen extends StatelessWidget {
  const DailyAdhkarHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final primaryColor = isNightMode ? const Color(0xFFF5F5DC) : const Color(0xFF5D4037);
        final secondaryColor = isNightMode ? const Color(0xFFE6C98A) : const Color(0xFF8D6E63);

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text('أذكاري اليومية', style: AppTypography.header(fontSize: 24).copyWith(color: primaryColor)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              color: isNightMode ? const Color(0xFFF5F5DC) : const Color(0xFF5D4037),
            ),
          ),
          body: ListenableBuilder(
            listenable: ProgressService(),
            builder: (context, _) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'حِصْنٌ يرافقكِ طوال يومكِ',
                        style: AppTypography.arabic(fontSize: 16).copyWith(
                          color: secondaryColor.withValues(alpha: 0.8),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      // 1. أذكار الاستيقاظ
                      _CategoryCard(
                        title: 'أذكار الاستيقاظ',
                        category: DhikrCategory.wakingUp,
                        imagePath: 'assets/images/sun_new.png',
                        isNightMode: isNightMode,
                        onTap: () => Navigator.push(
                          context,
                          BookPageRoute(
                            page: const DhikrListScreen(
                              category: DhikrCategory.wakingUp,
                              title: 'أذكار الاستيقاظ',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // 2. أذكار الصباح
                      _CategoryCard(
                        title: 'أذكار الصباح',
                        category: DhikrCategory.morning,
                        imagePath: 'assets/images/category_b.png',
                        isNightMode: isNightMode,
                        onTap: () => Navigator.push(
                          context,
                          BookPageRoute(
                            page: const DhikrListScreen(
                              category: DhikrCategory.morning,
                              title: 'أذكار الصباح',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // 3. أذكار بعد الصلاة
                      _CategoryCard(
                        title: 'أذكار بعد الصلاة',
                        category: DhikrCategory.afterPrayer,
                        imagePath: 'assets/images/category_b.png',
                        isNightMode: isNightMode,
                        onTap: () => Navigator.push(
                          context,
                          BookPageRoute(
                            page: const DhikrListScreen(
                              category: DhikrCategory.afterPrayer,
                              title: 'أذكار بعد الصلاة',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // 4. أذكار الخروج من المنزل
                      _CategoryCard(
                        title: 'أذكار الخروج من المنزل',
                        category: DhikrCategory.leavingHome,
                        imagePath: 'assets/images/category_b.png',
                        isNightMode: isNightMode,
                        onTap: () => Navigator.push(
                          context,
                          BookPageRoute(
                            page: const DhikrListScreen(
                              category: DhikrCategory.leavingHome,
                              title: 'أذكار الخروج من المنزل',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // 5. أذكار الدخول إلى المنزل
                      _CategoryCard(
                        title: 'أذكار الدخول إلى المنزل',
                        category: DhikrCategory.enteringHome,
                        imagePath: 'assets/images/category_b.png',
                        isNightMode: isNightMode,
                        onTap: () => Navigator.push(
                          context,
                          BookPageRoute(
                            page: const DhikrListScreen(
                              category: DhikrCategory.enteringHome,
                              title: 'أذكار الدخول إلى المنزل',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // 6. أذكار المساء
                      _CategoryCard(
                        title: 'أذكار المساء',
                        category: DhikrCategory.evening,
                        imagePath: 'assets/images/category_c.png',
                        isNightMode: isNightMode,
                        onTap: () => Navigator.push(
                          context,
                          BookPageRoute(
                            page: const DhikrListScreen(
                              category: DhikrCategory.evening,
                              title: 'أذكار المساء',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // 7. أذكار قبل النوم
                      _CategoryCard(
                        title: 'أذكار قبل النوم',
                        category: DhikrCategory.sleep,
                        imagePath: 'assets/images/category_e.png',
                        isNightMode: isNightMode,
                        onTap: () => Navigator.push(
                          context,
                          BookPageRoute(
                            page: const DhikrListScreen(
                              category: DhikrCategory.sleep,
                              title: 'أذكار قبل النوم',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final String title;
  final DhikrCategory category;
  final String imagePath;
  final VoidCallback onTap;
  final bool isNightMode;

  const _CategoryCard({
    required this.title,
    required this.category,
    required this.imagePath,
    required this.onTap,
    this.isNightMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final adhkars = DhikrRepository.getByCategory(category);
    final completedCount = ProgressService().getCompletedCountForCategory(
      adhkars.map((d) => d.id).toList(),
    );
    final progress = adhkars.isEmpty ? 0.0 : completedCount / adhkars.length;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('assets/images/category_frame_simple.png'),
              fit: BoxFit.fill,
            ),
            boxShadow: isNightMode ? null : AppColors.premiumShadow,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              // Overlay for night mode to make text readable if image is bright
              if (isNightMode)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(15),
                  child: Center(
                    child: Text(
                      title,
                      style: AppTypography.header(fontSize: 20).copyWith(
                        color: isNightMode ? const Color(0xFFF5F5DC) : const Color(0xFF5D4037),
                      ),
                    ),
                  ),
                ),
              ),
              // Progress Line INSIDE the box at the bottom
              if (progress > 0)
                Positioned(
                  bottom: 6,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6C98A).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(1.5),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      widthFactor: progress,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE6C98A),
                          borderRadius: BorderRadius.circular(1.5),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
