import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/design_system.dart';
import '../../core/theme_service.dart';
import '../../shared/scaffold_with_background.dart';

class TasbihScreen extends StatefulWidget {
  const TasbihScreen({super.key});

  @override
  State<TasbihScreen> createState() => _TasbihScreenState();
}

class _TasbihScreenState extends State<TasbihScreen>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  int _totalCounter = 0;
  String _currentTasbih = 'سبحان الله';

  final List<String> _suggestions = [
    'سبحان الله',
    'الحمد لله',
    'لا إله إلا الله',
    'الله أكبر',
    'أستغفر الله',
    'لاحول ولاقوة إلا بالله',
    'ما شاء الله',
    'حسبنا الله ونعم الوكيل',
    'اللهم صل على النبي',
  ];

  late AnimationController _beadController;

  @override
  void initState() {
    super.initState();
    _beadController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCounter = prefs.getInt('tasbih_counter') ?? 0;
    final savedTotal = prefs.getInt('tasbih_total_counter') ?? 0;
    final lastUpdated = prefs.getString('tasbih_last_updated');

    setState(() {
      _totalCounter = savedTotal;
    });

    if (lastUpdated != null) {
      final lastDate = DateTime.parse(lastUpdated);
      final difference = DateTime.now().difference(lastDate);

      // Reset if more than 24 hours have passed
      if (difference.inHours >= 24) {
        _reset(); // Will save 0 for daily but keep total
      } else {
        setState(() {
          _counter = savedCounter;
        });
      }
    }
  }

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('tasbih_counter', _counter);
    await prefs.setInt('tasbih_total_counter', _totalCounter);
    await prefs.setString(
      'tasbih_last_updated',
      DateTime.now().toIso8601String(),
    );
  }

  @override
  void dispose() {
    _beadController.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      _counter++;
      _totalCounter++;
    });
    _saveCounter();

    // Haptics - added simple vibration for every tap as requested
    HapticFeedback.lightImpact();

    _beadController.reset();
    _beadController.forward();
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
    _saveCounter();
    HapticFeedback.vibrate();
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
        final secondaryColor = isNightMode
            ? const Color(0xFFE6C98A)
            : const Color(0xFF8D6E63);

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'سبحتي',
                  style: AppTypography.header(
                    fontSize: 24,
                  ).copyWith(color: primaryColor),
                ),
                const SizedBox(height: 12),
                Text(
                  'تسبيحات تردد بهدوء… ومع حضور القلب',
                  style: AppTypography.arabic(fontSize: 14).copyWith(
                    color: secondaryColor.withValues(alpha: 0.7),
                    fontWeight: FontWeight.normal,
                  ),
                ),
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
            toolbarHeight: 110,
          ),
          body: GestureDetector(
            onTap: _increment,
            behavior: HitTestBehavior.opaque,
            child: SafeArea(
              child: Column(
                children: [
                  const Spacer(flex: 1),

                  // Current word display in a beautiful floral frame A
                  Container(
                    height: 120,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          isNightMode
                              ? 'assets/images/doua_frame-nigth.png'
                              : 'assets/images/header_frame_a.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Text(
                          _currentTasbih,
                          textAlign: TextAlign.center,
                          style: AppTypography.arabic(fontSize: 22).copyWith(
                            color: isNightMode
                                ? const Color(0xFFF5F5DC)
                                : const Color(0xFF5D4037),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(flex: 1),

                  // Interactive Sebha (Circular beads)
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Beads circle
                      AnimatedBuilder(
                        animation: _beadController,
                        builder: (context, child) {
                          return Transform.rotate(
                            angle:
                                (_counter + _beadController.value) *
                                (2 * math.pi / 33),
                            child: child,
                          );
                        },
                        child: SizedBox(
                          width: 250,
                          height: 250,
                          child: Stack(
                            children: List.generate(33, (index) {
                              final angle = (index * 2 * math.pi) / 33;
                              return Positioned(
                                left: 125 + 105 * math.cos(angle) - 10,
                                top: 125 + 105 * math.sin(angle) - 10,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: RadialGradient(
                                      colors: [
                                        isNightMode
                                            ? const Color(0xFFD7CCC8)
                                            : const Color(0xFFFDF5F7),
                                        index == 0
                                            ? const Color(0xFFE6C98A)
                                            : (isNightMode
                                                  ? const Color(0xFF4E342E)
                                                  : const Color(0xFFF4C6D7)),
                                      ],
                                      center: const Alignment(-0.3, -0.3),
                                    ),
                                    border: Border.all(
                                      color: const Color(0xFFE6C98A),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(
                                          alpha: 0.1,
                                        ),
                                        blurRadius: 4,
                                        offset: const Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),

                      // Central Counter
                      TweenAnimationBuilder<double>(
                        key: ValueKey(_counter),
                        tween: Tween(begin: 1.0, end: 1.2),
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.easeOut,
                        builder: (context, scale, child) {
                          return Transform.scale(
                            scale: scale,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '$_counter',
                                  style: AppTypography.arabic(fontSize: 50)
                                      .copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          if (scale > 1.0)
                                            Shadow(
                                              color: const Color(
                                                0xFFE6C98A,
                                              ).withValues(alpha: 0.5),
                                              blurRadius: 10,
                                            ),
                                        ],
                                      ),
                                ),
                                Text(
                                  'تسبيحة',
                                  style: AppTypography.arabic(
                                    fontSize: 14,
                                  ).copyWith(color: secondaryColor),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Reset Button
                  IconButton(
                    onPressed: _reset,
                    icon: const Icon(
                      Icons.refresh_rounded,
                      color: Color(0xFFC09D63),
                      size: 32,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),

                  const Spacer(flex: 1),

                  // Suggestion Carousel
                  Text(
                    'اختاري ذكركِ',
                    style: AppTypography.arabic(fontSize: 16).copyWith(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8,
                      runSpacing: 8,
                      children: _suggestions.map((suggestion) {
                        final isSelected = suggestion == _currentTasbih;
                        return ChoiceChip(
                          label: Text(suggestion),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              setState(() => _currentTasbih = suggestion);
                            }
                          },
                          labelStyle: AppTypography.arabic(fontSize: 12)
                              .copyWith(
                                color: isSelected
                                    ? (isNightMode
                                          ? Colors.black87
                                          : Colors.white)
                                    : primaryColor,
                              ),
                          selectedColor: isNightMode
                              ? const Color(0xFFE6C98A)
                              : const Color(0xFFF4C6D7),
                          backgroundColor: isNightMode
                              ? const Color(0xFF4E342E).withValues(alpha: 0.6)
                              : Colors.white.withValues(alpha: 0.8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: isSelected
                                  ? const Color(0xFFE6C98A)
                                  : Colors.transparent,
                            ),
                          ),
                          showCheckmark: false,
                        );
                      }).toList(),
                    ),
                  ),
                  const Spacer(flex: 1),

                  // Lifetime Total Balance at the bottom
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6C98A).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: const Color(0xFFE6C98A).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      'رصيدكِ من التسبيح: $_totalCounter',
                      style: AppTypography.arabic(fontSize: 16).copyWith(
                        color: const Color(0xFFC09D63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
