import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import '../../core/design_system.dart';
import '../../core/progress_service.dart';
import '../../shared/scaffold_with_background.dart';
import '../tasbih/tasbih_screen.dart';
import '../feelings/feelings_screen.dart';
import '../../core/transitions.dart';
import 'daily_adhkar_hub_screen.dart';
import '../../core/notification_service.dart';
import '../../core/intention_service.dart';
import '../../core/theme_service.dart';
import '../../core/prayer_service.dart';
import 'widgets/prayer_indicator.dart';
import 'widgets/gratitude_corner.dart';
import 'widgets/share_sheet.dart';
import 'widgets/contact_sheet.dart';
import 'widgets/home_widgets_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  final List<Map<String, String>> inspirations = [
    {'text': 'ألا بذكر الله تطمئن القلوب', 'source': 'سورة الرعد'},
    {'text': 'فاذكروني أذكركم', 'source': 'سورة البقرة'},
    {'text': 'والذاكرين الله كثيراً والذاكرات', 'source': 'سورة الأحزاب'},
    {
      'text': 'من لزم الاستغفار جعل الله له من كل ضيق مخرجاً',
      'source': 'حديث شريف',
    },
    {
      'text': 'كلمتان خفيفتان على اللسان ثقيلتان في الميزان',
      'source': 'حديث شريف',
    },
  ];

  late Map<String, String> dailyInspiration;

  @override
  void initState() {
    super.initState();
    dailyInspiration = inspirations[DateTime.now().day % inspirations.length];

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );
    _fadeController.forward();

    ProgressService().addListener(_updateUI);
    PrayerService().initialize(); // Initialize prayer times
  }

  @override
  void dispose() {
    _fadeController.dispose();
    ProgressService().removeListener(_updateUI);
    super.dispose();
  }

  void _updateUI() {
    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Force check time when screen loads/appears
    ThemeService().checkSystemTime();
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) return 'صباح الخير والذكر';
    if (hour >= 12 && hour < 17) return 'طاب يومكِ بذكر الله';
    if (hour >= 17 && hour < 22) return 'مساء السكينة والطمأنينة';
    return 'ليلة هادئة في حفظ الله';
  }

  Color _getThemeTint() {
    return Colors.transparent; // Keep background consistent regardless of time
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final dayName = _getArabicDayName(now.weekday);
    final gregorianDay = now.day;
    final gregorianMonth = _getArabicGregorianMonth(now.month);
    final gregorianYear = now.year;

    final hijriDate = HijriCalendar.now();
    final hijriMonth = _getArabicHijriMonth(hijriDate.hMonth);

    // Formatting date for diary style (without "اليوم")
    final dateFormatted =
        '$dayName $gregorianDay $gregorianMonth $gregorianYear • ${hijriDate.hDay} $hijriMonth ${hijriDate.hYear} هـ';

    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        // Text Color Logic
        final primaryTextColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        final secondaryTextColor = isNightMode
            ? const Color(0xFFE6C98A).withValues(alpha: 0.9)
            : const Color(0xFF8D6E63).withValues(alpha: 0.8);
        final dateTextColor = isNightMode
            ? const Color(0xFFE6C98A).withValues(alpha: 0.9)
            : const Color(0xFF8D6E63);

        return ScaffoldWithBackground(
          backgroundColor: _getThemeTint(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: kToolbarHeight,
            centerTitle: true,
            title:
                null, // Title removed from body header, preserved in app metadata
            leading: ListenableBuilder(
              listenable: NotificationService(),
              builder: (context, _) {
                final notifications = NotificationService();
                return IconButton(
                  icon: Icon(
                    notifications.isEnabled
                        ? Icons.notifications_active_outlined
                        : Icons.notifications_off_outlined,
                    color: const Color(0xFFC09D63),
                    size: 26,
                  ),
                  onPressed: () => notifications.toggleNotifications(),
                  tooltip: 'التنبيهات',
                );
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isNightMode ? Icons.light_mode : Icons.dark_mode,
                  color: const Color(0xFFC09D63),
                  size: 26,
                ),
                onPressed: () => ThemeService().toggle(),
                tooltip: isNightMode ? 'الوضع النهاري' : 'الوضع الليلي',
              ),
              const SizedBox(width: 8),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: SafeArea(
            bottom: false,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  10,
                  20,
                  16,
                ), // Reduced top padding significantly
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Unified Header Block in Body
                    Column(
                      children: [
                        Text(
                          'السلام عليكِ يا غالية',
                          style: AppTypography.arabic(
                            fontSize: 18,
                          ).copyWith(color: secondaryTextColor, height: 1.2),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _getGreeting(),
                          style: AppTypography.arabic(fontSize: 24).copyWith(
                            // Larger and bolder
                            color: primaryTextColor,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Small decorative separator
                        Container(
                          width: 40,
                          height: 2,
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFFE6C98A,
                            ).withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(1),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          dateFormatted,
                          textAlign: TextAlign.center,
                          style: AppTypography.arabic(fontSize: 14).copyWith(
                            color: dateTextColor,
                            fontStyle: FontStyle.italic,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    const SizedBox(height: 25),
                    PrayerIndicator(isNightMode: isNightMode),
                    const SizedBox(height: 35),

                    // Intention Renewal Section
                    _FeatureSection(
                      title: 'ركن تجديد النية',
                      isNightMode: isNightMode,
                      onTap: () {
                        // ... dialog code ...
                        final intention = IntentionService().dailyIntention;
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: isNightMode
                                ? const Color(0xFF4E342E)
                                : const Color(0xFFFFF8E1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                              side: const BorderSide(
                                color: Color(0xFFE6C98A),
                                width: 1.5,
                              ),
                            ),
                            title: Center(
                              child: Text(
                                'تذكّري دائمًا… النية محلّها القلب',
                                textAlign: TextAlign.center,
                                style: AppTypography.arabic(
                                  fontSize: 20,
                                ).copyWith(color: const Color(0xFFC09D63)),
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  intention.description,
                                  textAlign: TextAlign.center,
                                  style: AppTypography.arabic(fontSize: 19)
                                      .copyWith(
                                        color: isNightMode
                                            ? const Color(0xFFF5F5DC)
                                            : const Color(0xFF5D4037),
                                        height: 1.6,
                                      ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Daily Adhkars Section (Hub)
                    _FeatureSection(
                      title: 'أذكاري اليومية',
                      isNightMode: isNightMode,
                      onTap: () => Navigator.push(
                        context,
                        BookPageRoute(page: const DailyAdhkarHubScreen()),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Sebha Section (Floral Frame A)
                    _FeatureSection(
                      title: 'سبحتي',
                      isNightMode: isNightMode,
                      onTap: () => Navigator.push(
                        context,
                        BookPageRoute(page: const TasbihScreen()),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Feature Section: Feelings
                    _FeatureSection(
                      title: 'كيف حالكِ؟',
                      isNightMode: isNightMode,
                      onTap: () => Navigator.push(
                        context,
                        BookPageRoute(page: const FeelingsScreen()),
                      ),
                    ),

                    const SizedBox(height: 20),

                    GratitudeCorner(isNightMode: isNightMode),
                    const SizedBox(height: 48),

                    // Inspiration Section (Simple style - no frame)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Text(
                            dailyInspiration['text']!,
                            textAlign: TextAlign.center,
                            style: AppTypography.arabic(fontSize: 18).copyWith(
                              color: isNightMode
                                  ? const Color(
                                      0xFFE6C98A,
                                    ).withValues(alpha: 0.9)
                                  : const Color(0xFF8D6E63),
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '— ${dailyInspiration['source']}',
                            style: AppTypography.header(fontSize: 12).copyWith(
                              color: isNightMode
                                  ? const Color(
                                      0xFFE6C98A,
                                    ).withValues(alpha: 0.6)
                                  : const Color(
                                      0xFF8D6E63,
                                    ).withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Contact Us Section
                    const _ContactSection(),

                    const SizedBox(height: 30),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getArabicDayName(int weekday) {
    const days = [
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
      'الأحد',
    ];
    return days[weekday - 1];
  }

  String _getArabicGregorianMonth(int month) {
    const months = [
      'يناير',
      'فبراير',
      'مارس',
      'أبريل',
      'مايو',
      'يونيو',
      'يوليو',
      'أغسطس',
      'سبتمبر',
      'أكتوبر',
      'نوفمبر',
      'ديسمبر',
    ];
    return months[month - 1];
  }

  String _getArabicHijriMonth(int month) {
    const months = [
      'محرم',
      'صفر',
      'ربيع الأول',
      'ربيع الثاني',
      'جمادى الأولى',
      'جمادى الآخرة',
      'رجب',
      'شعبان',
      'رمضان',
      'شوال',
      'ذو القعدة',
      'ذو الحجة',
    ];
    return months[month - 1];
  }
}

class _FeatureSection extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isNightMode;

  const _FeatureSection({
    required this.title,
    required this.onTap,
    this.isNightMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: Text(
            title,
            style: AppTypography.header(fontSize: 24).copyWith(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ContactIconButton(
          icon: Icons.email_outlined,
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ContactSheet(),
            );
          },
        ),
        const SizedBox(width: 25),
        ContactIconButton(
          icon: Icons.share_outlined,
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ShareSheet(),
            );
          },
        ),
      ],
    );
  }
}
