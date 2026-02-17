import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../core/design_system.dart';
import '../../core/models.dart';
import '../../core/repository.dart';
import '../../shared/scaffold_with_background.dart';
import '../dhikr_detail/dhikr_detail_screen.dart';
import '../../core/progress_service.dart';
import '../../core/transitions.dart';
import '../../core/theme_service.dart';
import '../../core/utils.dart';
import 'surat_al_mulk_screen.dart';

class DhikrListScreen extends StatefulWidget {
  final DhikrCategory category;
  final String title;

  const DhikrListScreen({
    super.key,
    required this.category,
    required this.title,
  });

  @override
  State<DhikrListScreen> createState() => _DhikrListScreenState();
}

class _DhikrListScreenState extends State<DhikrListScreen> {
  late List<Dhikr> adhkars;
  final Set<String> completedIds = {};
  double fontSizeMultiplier = 1.0;
  bool isShortMode = false;

  @override
  void initState() {
    super.initState();
    adhkars = DhikrRepository.getByCategory(widget.category);
    // Load existing progress
    completedIds.addAll(
      ProgressService().completedIds.intersection(
        adhkars.map((d) => d.id).toSet(),
      ),
    );
  }

  void _handleCompleted(String id) async {
    // On attend un court instant pour que l'utilisateur voit "تم بحمد الله"
    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() {
        completedIds.add(id);
      });
      ProgressService().markCompleted(id);
    }
  }

  void _resetProgress() {
    setState(() {
      for (var dhikr in adhkars) {
        completedIds.remove(dhikr.id);
        ProgressService().unmarkCompleted(dhikr.id);
      }
    });
    // Haptic removed
  }

  void _zoomIn() {
    setState(() {
      if (fontSizeMultiplier < 1.3) fontSizeMultiplier += 0.3;
    });
    // Haptic removed
  }

  void _zoomOut() {
    setState(() {
      if (fontSizeMultiplier > 0.71) fontSizeMultiplier -= 0.3;
    });
    // Haptic removed
  }

  void _toggleNightMode() {
    ThemeService().toggle();
    // Haptic removed
  }

  void _toggleShortMode() {
    setState(() {
      isShortMode = !isShortMode;
    });
    // Haptic removed
  }

  @override
  Widget build(BuildContext context) {
    // Filter adhkars based on mode
    final currentAdhkars = isShortMode
        ? adhkars.where((d) => d.isEssential).toList()
        : adhkars;

    double progress = currentAdhkars.isEmpty
        ? 0
        : completedIds
                  .where((id) => currentAdhkars.any((d) => d.id == id))
                  .length /
              currentAdhkars.length;
    final visibleAdhkars = currentAdhkars
        .where((d) => !completedIds.contains(d.id))
        .toList();

    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;

        return ScaffoldWithBackground(
          appBar: AppBar(
            toolbarHeight: 80, // Increased to accommodate two-line title
            title: Column(
              children: [
                Text(
                  widget.title.preventOrphan(),
                  style: AppTypography.header(fontSize: 24).copyWith(
                    color: isNightMode
                        ? const Color(0xFFF5F5DC)
                        : const Color(0xFF5D4037),
                  ),
                ),
                if (isShortMode) ...[
                  const SizedBox(height: 4),
                  Text(
                    'أَدْوَمُهَا وَإِنْ قَلَّ'.preventOrphan(),
                    style: AppTypography.arabic(fontSize: 14).copyWith(
                      color: const Color(0xFFC09D63),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                      icon: isNightMode ? Icons.light_mode : Icons.dark_mode,
                      onPressed: _toggleNightMode,
                      tooltip: 'وضع القراءة',
                      color: const Color(0xFFC09D63),
                    ),
                    if (widget.category == DhikrCategory.morning ||
                        widget.category == DhikrCategory.evening) ...[
                      const SizedBox(width: 8),
                      _buildActionButton(
                        icon: isShortMode
                            ? Icons.auto_awesome
                            : Icons.auto_awesome_outlined,
                        onPressed: _toggleShortMode,
                        tooltip: 'أذكار مختصرة',
                        color: isShortMode
                            ? Colors.orangeAccent
                            : const Color(0xFFC09D63),
                      ),
                    ],
                    if (widget.category == DhikrCategory.sleep) ...[
                      const SizedBox(width: 8),
                      _buildActionButton(
                        icon: Icons.auto_stories_outlined,
                        onPressed: () {
                          Navigator.push(
                            context,
                            BookPageRoute(page: const SuratAlMulkScreen()),
                          );
                        },
                        tooltip: 'سورة الملك',
                        color: const Color(0xFFC09D63),
                      ),
                    ],
                    const SizedBox(width: 8),
                    _buildActionButton(
                      icon: Icons.replay,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('إِعَادَةُ ضَبْطِ التَّقَدُّمِ'),
                            content: const Text(
                              'هَلْ أَنْتِ مُتَأَكِّدَةٌ مِنْ رَغْبَتِكِ فِي إِعَادَةِ ضَبْطِ التَّقَدُّمِ لِهَذِهِ الْفِئَةِ؟',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'إِلْغَاءٌ',
                                  style: TextStyle(
                                    color: Color(0xFF8D6E63),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  _resetProgress();
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'إِعَادَةُ الضَّبْطِ',
                                  style: TextStyle(
                                    color: Color(0xFFC09D63),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      tooltip: 'إِعَادَةُ ضَبْطِ التَّقَدُّمِ',
                      color: const Color(0xFFC09D63),
                    ),
                    const SizedBox(width: 8),
                    _buildActionButton(
                      icon: Icons.zoom_out,
                      onPressed: _zoomOut,
                      tooltip: 'تصغير الخط',
                      color: const Color(0xFFC09D63),
                    ),
                    _buildActionButton(
                      icon: Icons.zoom_in,
                      onPressed: _zoomIn,
                      tooltip: 'تكبير الخط',
                      color: const Color(0xFFC09D63),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              if (visibleAdhkars.isEmpty && progress == 1.0)
                Center(
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 1500),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'نَفَعَكِ اللَّهُ بِذِكْرِهِ'.preventOrphan(),
                              style: AppTypography.arabic(fontSize: 28)
                                  .copyWith(
                                    color: isNightMode
                                        ? const Color(0xFFF5F5DC)
                                        : const Color(0xFF8D6E63),
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 30),
                            IconButton(
                              icon: const Icon(
                                Icons.replay_rounded,
                                size: 50,
                                color: Color(0xFFC09D63),
                              ),
                              onPressed: _resetProgress,
                              tooltip: 'إعادة القراءة',
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              else
                ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    20 +
                        (10 * math.max(0.0, fontSizeMultiplier - 1.0))
                            .toDouble(),
                    16,
                    20,
                  ),
                  itemCount: visibleAdhkars.length,
                  itemBuilder: (context, index) {
                    final dhikr = visibleAdhkars[index];
                    return _DhikrCard(
                      key: ValueKey(dhikr.id),
                      dhikr: dhikr,
                      category: widget.category,
                      onCompleted: () => _handleCompleted(dhikr.id),
                      fontSizeMultiplier: fontSizeMultiplier,
                      isNightMode: isNightMode,
                    );
                  },
                ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    height: 4,
                    width: MediaQuery.of(context).size.width * progress,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6C98A),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE6C98A).withValues(alpha: 0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
    required Color color,
  }) {
    return IconButton(
      icon: Icon(icon, size: 22, color: color),
      onPressed: onPressed,
      tooltip: tooltip,
      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
      padding: EdgeInsets.zero,
    );
  }
}

class _DhikrCard extends StatefulWidget {
  final Dhikr dhikr;
  final DhikrCategory category;
  final VoidCallback onCompleted;
  final double fontSizeMultiplier;
  final bool isNightMode;

  const _DhikrCard({
    super.key,
    required this.dhikr,
    required this.category,
    required this.onCompleted,
    required this.fontSizeMultiplier,
    required this.isNightMode,
  });

  @override
  State<_DhikrCard> createState() => _DhikrCardState();
}

enum LanguageMode { arabic, english, french }

class _DhikrCardState extends State<_DhikrCard> {
  late int currentCount;
  bool isCompleted = false;
  LanguageMode languageMode = LanguageMode.arabic;

  @override
  void initState() {
    super.initState();
    currentCount = widget.dhikr.repetitions;
    isCompleted = currentCount == 0;
  }

  void _decrementCount() {
    if (currentCount > 0) {
      setState(() {
        currentCount--;
      });
      // Haptic removed

      if (currentCount == 0) {
        setState(() {
          isCompleted = true;
        });
        // Haptic removed
        widget.onCompleted(); // Notifier le parent
      }
    }
  }

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
    final textColor = widget.isNightMode
        ? const Color(0xFFF5F5DC) // Blanc écru
        : const Color(0xFF5D4037);

    final accentColor = const Color(0xFFE6C98A);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            widget.isNightMode
                ? 'assets/images/dhikr_frame_night.png'
                : 'assets/images/dhikr_frame_day.png',
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: isCompleted ? null : _decrementCount,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            15 * widget.fontSizeMultiplier,
            35 * widget.fontSizeMultiplier,
            15 * widget.fontSizeMultiplier,
            25 * widget.fontSizeMultiplier,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _getDisplayText(),
                textAlign: TextAlign.center,
                style:
                    (languageMode == LanguageMode.arabic
                            ? AppTypography.arabic(
                                fontSize: 22 * widget.fontSizeMultiplier,
                              )
                            : AppTypography.uiBody(
                                fontSize: 16 * widget.fontSizeMultiplier,
                              ))
                        .copyWith(
                          color: isCompleted
                              ? (widget.isNightMode
                                    ? Colors.white38
                                    : Colors.grey)
                              : textColor,
                          height: languageMode == LanguageMode.arabic
                              ? 1.5
                              : 1.3,
                        ),
              ),
              const SizedBox(height: 12),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: accentColor, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'فضل الذكر',
                            style: AppTypography.arabic(fontSize: 11).copyWith(
                              color: widget.isNightMode
                                  ? accentColor
                                  : const Color(0xFF8D6E63),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/images/book_details.png',
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  isCompleted
                      ? Text(
                          'تم بحمد الله',
                          style: AppTypography.header(fontSize: 12).copyWith(
                            color: widget.isNightMode
                                ? accentColor
                                : const Color(0xFF8D6E63),
                          ),
                        )
                      : SizedBox(
                          width: 40,
                          height: 40,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset(
                                'assets/images/counter_badge.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                                color: widget.isNightMode ? accentColor : null,
                              ),
                              Text(
                                '$currentCount',
                                style: AppTypography.header(fontSize: 14)
                                    .copyWith(
                                      color: widget.isNightMode
                                          ? Colors.black87
                                          : const Color(0xFF8D6E63),
                                    ),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(width: 12),
                  InkWell(
                    onTap: _toggleLanguage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: accentColor, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ترجمة',
                            style: AppTypography.arabic(fontSize: 11).copyWith(
                              color: widget.isNightMode
                                  ? accentColor
                                  : const Color(0xFF8D6E63),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/images/translate_v2.png',
                            width: 24,
                            height: 24,
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
      ),
    );
  }
}
