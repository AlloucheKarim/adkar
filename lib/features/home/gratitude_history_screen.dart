import 'package:flutter/material.dart';
import '../../core/utils.dart';
import '../../core/design_system.dart';
import '../../core/theme_service.dart';
import '../../core/gratitude_service.dart';
import '../../shared/scaffold_with_background.dart';

class GratitudeHistoryScreen extends StatelessWidget {
  const GratitudeHistoryScreen({super.key});

  void _confirmDelete(BuildContext context, String dateStr) {
    final isNightMode = ThemeService().isNightMode;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: isNightMode
              ? const Color(0xFF3E2723)
              : const Color(0xFFFFFDF9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: const Color(0xFFE6C98A).withValues(alpha: 0.3),
            ),
          ),
          title: Text(
            'حَذْفُ الخَاطِرَةِ'.preventOrphan(),
            textAlign: TextAlign.center,
            style: AppTypography.header(fontSize: 20).copyWith(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
          ),
          content: Text(
            'هَلْ أَنْتِ مُتَأَكِّدَةٌ مِنْ حَذْفِ هَذِهِ الخَاطِرَةِ؟'.preventOrphan(),
            textAlign: TextAlign.center,
            style: AppTypography.arabic(fontSize: 16).copyWith(
              color: isNightMode
                  ? const Color(0xFFE6C98A)
                  : const Color(0xFF8D6E63),
            ),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'إِلْغَاء',
                style: AppTypography.uiBody(
                  color: isNightMode
                      ? const Color(0xFFF5F5DC).withValues(alpha: 0.7)
                      : Colors.grey,
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                GratitudeService().deleteEntry(dateStr);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('تَمَّ حَذْفُ الخَاطِرَةِ بِنَجَاحٍ')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red[300],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'حَذْف',
                style: AppTypography.uiBody(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge([ThemeService(), GratitudeService()]),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final reversedEntries = GratitudeService().entries.reversed.toList();

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text(
              'سِجِلُّ الِامْتِنَانِ'.preventOrphan(),
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
          body: reversedEntries.isEmpty
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.auto_awesome_outlined,
                          size: 64,
                          color: const Color(0xFFE6C98A).withValues(alpha: 0.8),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'لَا تُوجَدُ خَوَاطِرُ مُسَجَّلَةٌ بَعْدُ'.preventOrphan(),
                          textAlign: TextAlign.center,
                          style: AppTypography.arabic(fontSize: 20).copyWith(
                            color: isNightMode
                                ? const Color(0xFFF5F5DC)
                                : const Color(0xFF5D4037),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'ابْدَأِي بِكِتَابَةِ امْتِنَانِكِ اليَوْمَ لِيَظْهَرَ هُنَا'.preventOrphan(),
                          textAlign: TextAlign.center,
                          style: AppTypography.uiBody(fontSize: 14).copyWith(
                            color: isNightMode
                                ? const Color(0xFFF5F5DC).withValues(alpha: 0.6)
                                : const Color(0xFF8D6E63).withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  itemCount: reversedEntries.length,
                  itemBuilder: (context, index) {
                    final entry = reversedEntries[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: isNightMode
                            ? const Color(0xFF4E342E).withValues(alpha: 0.5)
                            : Colors.white.withValues(alpha: 0.7),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFFE6C98A).withValues(alpha: 0.2),
                        ),
                        boxShadow: isNightMode ? null : AppColors.premiumShadow,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_outlined,
                                    size: 14,
                                    color: const Color(0xFFC09D63).withValues(alpha: 0.8),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    entry.date,
                                    style: AppTypography.phonetic(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ).copyWith(
                                      color: isNightMode
                                          ? const Color(0xFFE6C98A)
                                          : const Color(0xFFC09D63),
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete_outline, size: 20),
                                color: Colors.red[300]?.withValues(alpha: 0.8),
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                onPressed: () => _confirmDelete(context, entry.date),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              entry.content.preventOrphan(),
                              textAlign: TextAlign.right,
                              style: AppTypography.arabic(fontSize: 18).copyWith(
                                color: isNightMode
                                    ? const Color(0xFFF5F5DC)
                                    : AppColors.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
