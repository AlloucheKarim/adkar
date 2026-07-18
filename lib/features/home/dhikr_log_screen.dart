import 'package:flutter/material.dart';
import '../../core/utils.dart';
import '../../core/design_system.dart';
import '../../core/theme_service.dart';
import '../../core/progress_service.dart';
import '../../core/models.dart';
import '../../shared/scaffold_with_background.dart';

class DhikrLogScreen extends StatelessWidget {
  const DhikrLogScreen({super.key});

  static String _getCategoryName(DhikrCategory category) {
    switch (category) {
      case DhikrCategory.morning:
        return 'أَذْكَار الصَّبَاح';
      case DhikrCategory.evening:
        return 'أَذْكَار الْمَسَاء';
      case DhikrCategory.sleep:
        return 'أَذْكَار قَبْلَ النَّوْم';
      case DhikrCategory.wakingUp:
        return 'أَذْكَار الِاسْتِيقَاظ';
      case DhikrCategory.afterPrayer:
        return 'أَذْكَار بَعْدَ الصَّلَاة';
      case DhikrCategory.leavingHome:
        return 'أَذْكَار الْخُرُوج مِنَ الْمَنْزِل';
      case DhikrCategory.enteringHome:
        return 'أَذْكَار الدُّخُول إِلَى الْمَنْزِل';
      case DhikrCategory.feelings:
        return 'دُعَاء الْمَشَاعِر';
    }
  }

  static String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final today = DateUtils.dateOnly(now);
      final d = DateUtils.dateOnly(date);

      if (d == today) return 'اليوم';
      if (d == today.subtract(const Duration(days: 1))) return 'أمس';

      const arabicMonths = [
        'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
        'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر',
      ];
      return '${date.day} ${arabicMonths[date.month - 1]} ${date.year}';
    } catch (_) {
      return dateStr;
    }
  }

  void _confirmDelete(BuildContext context, DhikrLogEntry entry) {
    final isNightMode = ThemeService().isNightMode;
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
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
            'حَذْفُ السِّجِلِّ'.preventOrphan(),
            textAlign: TextAlign.center,
            style: AppTypography.header(fontSize: 20).copyWith(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
          ),
          content: Text(
            'هَلْ تُرِيدُ حَذْفَ هَذَا السِّجِلِّ؟'.preventOrphan(),
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
              onPressed: () => Navigator.pop(ctx),
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
                ProgressService().deleteLogEntry(entry.date, entry.category);
                Navigator.pop(ctx);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC09D63),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'حَذْف',
                style: AppTypography.uiBody(fontSize: 16, color: Colors.white),
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
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        final subtitleColor = isNightMode
            ? const Color(0xFFE6C98A).withValues(alpha: 0.8)
            : const Color(0xFF8D6E63);
        final cardColor = isNightMode
            ? const Color(0xFF4E342E).withValues(alpha: 0.55)
            : Colors.white.withValues(alpha: 0.6);

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text(
              'سِجِلُّ الأَذْكَار',
              style: AppTypography.header(fontSize: 24).copyWith(
                color: primaryColor,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(color: primaryColor),
          ),
          body: ListenableBuilder(
            listenable: ProgressService(),
            builder: (context, _) {
              final logs = ProgressService().dhikrLogs.reversed.toList();

              if (logs.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.menu_book_outlined,
                          size: 64,
                          color: const Color(0xFFE6C98A).withValues(alpha: 0.5),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'سِجِلُّكِ فَارِغٌ'.preventOrphan(),
                          style: AppTypography.arabic(fontSize: 22).copyWith(
                            color: subtitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'سَيَظْهَرُ هُنَا كُلُّ مَا أَتْمَمْتِيهِ مِنَ الأَذْكَار'.preventOrphan(),
                          textAlign: TextAlign.center,
                          style: AppTypography.arabic(fontSize: 16).copyWith(
                            color: subtitleColor.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // Group logs by date
              final Map<String, List<DhikrLogEntry>> grouped = {};
              for (final entry in logs) {
                grouped.putIfAbsent(entry.date, () => []).add(entry);
              }

              final sortedDates = grouped.keys.toList()
                ..sort((a, b) => b.compareTo(a));

              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                itemCount: sortedDates.length,
                itemBuilder: (context, idx) {
                  final dateStr = sortedDates[idx];
                  final entries = grouped[dateStr]!;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE6C98A).withValues(alpha: 0.2),
                      ),
                      boxShadow: isNightMode ? null : AppColors.premiumShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date Header
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6C98A).withValues(alpha: 0.12),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today_rounded,
                                    size: 16,
                                    color: const Color(0xFFC09D63),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    _formatDate(dateStr).preventOrphan(),
                                    style: AppTypography.arabic(fontSize: 16).copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFFC09D63),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                dateStr,
                                style: AppTypography.phonetic(fontSize: 12).copyWith(
                                  color: subtitleColor.withValues(alpha: 0.6),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Category entries for this date
                        ...entries.map((entry) => _buildEntryRow(
                          entry: entry,
                          isNightMode: isNightMode,
                          primaryColor: primaryColor,
                          subtitleColor: subtitleColor,
                          onDelete: () => _confirmDelete(context, entry),
                          isLast: entries.last == entry,
                        )),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildEntryRow({
    required DhikrLogEntry entry,
    required bool isNightMode,
    required Color primaryColor,
    required Color subtitleColor,
    required VoidCallback onDelete,
    required bool isLast,
  }) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6C98A).withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 20,
                  color: Color(0xFFC09D63),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  _getCategoryName(entry.category).preventOrphan(),
                  style: AppTypography.arabic(fontSize: 16).copyWith(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline_rounded,
                  size: 20,
                  color: subtitleColor.withValues(alpha: 0.5),
                ),
                onPressed: onDelete,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              ),
            ],
          ),
        ),
        if (!isLast)
          Divider(
            height: 1,
            indent: 20,
            endIndent: 20,
            color: const Color(0xFFE6C98A).withValues(alpha: 0.15),
          ),
      ],
    );
  }
}
