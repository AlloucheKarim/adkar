import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hijri/hijri_calendar.dart';
import '../../core/design_system.dart';
import '../../core/progress_service.dart';
import '../../shared/scaffold_with_background.dart';
import '../tasbih/tasbih_screen.dart';
import '../feelings/feelings_screen.dart';
import '../../core/transitions.dart';
import '../../core/gratitude_service.dart';
import 'gratitude_screen.dart';
import 'daily_adhkar_hub_screen.dart';
import '../../core/notification_service.dart';
import '../../core/intention_service.dart';
import '../../core/theme_service.dart';
import '../../core/prayer_service.dart';
import 'prayer_times_sheet.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/platform_utils.dart';

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

                    // Prayer Time Indicator
                    _PrayerIndicator(isNightMode: isNightMode),

                    const SizedBox(height: 16),

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

                    // Gratitude Corner Section
                    _GratitudeCorner(isNightMode: isNightMode),

                    const SizedBox(height: 20),

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
        _ContactIconButton(
          icon: Icons.email_outlined,
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const _ContactSheet(),
            );
          },
        ),
        const SizedBox(width: 25),
        _ContactIconButton(
          icon: Icons.share_outlined,
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const _ShareSheet(),
            );
          },
        ),
      ],
    );
  }
}

class _ContactIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ContactIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE6C98A), width: 1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF8D6E63), size: 24),
      ),
    );
  }
}

class _GratitudeCorner extends StatelessWidget {
  final bool isNightMode;
  const _GratitudeCorner({this.isNightMode = false});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GratitudeService(),
      builder: (context, child) {
        final latest = GratitudeService().latestEntry;

        return Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isNightMode
                ? Colors.transparent
                : Colors.white.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFE6C98A).withValues(alpha: 0.3),
            ),
            boxShadow: isNightMode ? null : AppColors.premiumShadow,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.favorite,
                    color: Color(0xFFF4C6D7),
                    size: 20,
                  ),
                  Text(
                    'ركن الامتنان',
                    style: AppTypography.header(fontSize: 22).copyWith(
                      color: isNightMode
                          ? const Color(0xFFF5F5DC)
                          : const Color(0xFF5D4037),
                    ),
                  ),
                  const Icon(
                    Icons.favorite,
                    color: Color(0xFFF4C6D7),
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (latest != null)
                Text(
                  '"${latest.content}"',
                  textAlign: TextAlign.center,
                  style: AppTypography.arabic(fontSize: 18).copyWith(
                    color: isNightMode
                        ? const Color(0xFFE6C98A)
                        : const Color(0xFF8D6E63),
                    fontStyle: FontStyle.italic,
                  ),
                )
              else
                Text(
                  'ما هي النعمة التي تودين شكر الله عليها اليوم؟',
                  textAlign: TextAlign.center,
                  style: AppTypography.arabic(fontSize: 16).copyWith(
                    color: isNightMode
                        ? const Color(0xFFF5F5DC).withValues(alpha: 0.9)
                        : const Color(0xFF8D6E63).withValues(alpha: 0.7),
                  ),
                ),
              const SizedBox(height: 20),
              TextButton.icon(
                onPressed: () => Navigator.push(
                  context,
                  BookPageRoute(page: const GratitudeScreen()),
                ),
                icon: const Icon(Icons.edit_note, color: Color(0xFFC09D63)),
                label: Text(
                  latest != null ? 'تحديث خاطرتكِ' : 'اكتبي خاطرتكِ',
                  style: AppTypography.header(
                    fontSize: 14,
                    color: const Color(0xFFC09D63),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PrayerIndicator extends StatelessWidget {
  final bool isNightMode;

  const _PrayerIndicator({required this.isNightMode});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: PrayerService(),
      builder: (context, _) {
        final prayerService = PrayerService();

        final bgColor = isNightMode
            ? const Color(0xFF4E342E).withValues(alpha: 0.7)
            : Colors.white.withValues(alpha: 0.7);
        final primaryColor = isNightMode
            ? const Color(0xFFF5F5DC)
            : const Color(0xFF5D4037);
        final accentColor = const Color(0xFFE6C98A);

        // Don't show if no data and not loading
        if (!prayerService.hasData &&
            !prayerService.isLoading &&
            prayerService.errorMessage == null) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              builder: (context) => const PrayerTimesSheet(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: accentColor.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time_rounded, size: 18, color: accentColor),
                const SizedBox(width: 8),
                if (prayerService.isLoading)
                  Text(
                    'جاري التحميل...',
                    style: AppTypography.arabic(
                      fontSize: 14,
                    ).copyWith(color: primaryColor.withValues(alpha: 0.7)),
                  )
                else if (prayerService.errorMessage != null)
                  Text(
                    'اضغطي لتحديد الموقع',
                    style: AppTypography.arabic(
                      fontSize: 14,
                    ).copyWith(color: primaryColor.withValues(alpha: 0.7)),
                  )
                else if (prayerService.hasData)
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: prayerService.nextPrayerName,
                          style: AppTypography.arabic(fontSize: 14).copyWith(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ' بعد ',
                          style: AppTypography.arabic(
                            fontSize: 14,
                          ).copyWith(color: primaryColor),
                        ),
                        TextSpan(
                          text: prayerService.formattedTimeUntilNextPrayer,
                          style: AppTypography.arabic(fontSize: 14).copyWith(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(width: 6),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 18,
                  color: accentColor.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ShareSheet extends StatelessWidget {
  const _ShareSheet();

  final String shareText =
      'وجدت تطبيقًا للذكر بروح أنثوية هادئة… فأحببت أن أشاركه معكِ ';

  void _copyToClipboard(BuildContext context, String text, String label) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم نسخ رابط $label بنجاح'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: const Color(0xFF8D6E63),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isNightMode = ThemeService().isNightMode;
    final bgColor = isNightMode
        ? const Color(0xFF4E342E)
        : const Color(0xFFFFF8E1);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        border: Border.all(color: const Color(0xFFE6C98A), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFE6C98A).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'شاركي الخير ليعمّ الأجر',
            textAlign: TextAlign.center,
            style: AppTypography.arabic(fontSize: 18).copyWith(
              color: const Color(0xFFC09D63),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          _LinkRow(
            label: 'رابط المتجر',
            link: PlatformUtils.currentStoreUrl,
            icon: Icons.link_rounded,
            onCopy: () => _copyToClipboard(
              context,
              '$shareText\n\n${PlatformUtils.currentStoreUrl}',
              'الرسالة',
            ),
            isNightMode: isNightMode,
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () {
              Share.share('$shareText\n\n${PlatformUtils.currentStoreUrl}');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.share_rounded, size: 20),
            label: Text(
              'مشاركة الآن',
              style: AppTypography.arabic(
                fontSize: 16,
              ).copyWith(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC09D63),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  final String? label;
  final String link;
  final IconData icon;
  final VoidCallback onCopy;
  final bool isNightMode;
  final bool isCentered;

  const _LinkRow({
    this.label,
    required this.link,
    required this.icon,
    required this.onCopy,
    required this.isNightMode,
    this.isCentered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isNightMode
            ? Colors.white.withValues(alpha: 0.05)
            : Colors.white.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFE6C98A).withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisAlignment: isCentered
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFC09D63), size: 24),
          const SizedBox(width: 12),
          if (isCentered)
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  link,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: isNightMode ? Colors.white70 : Colors.grey[800],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null)
                    Text(
                      label!,
                      style: AppTypography.header(fontSize: 12).copyWith(
                        color: const Color(0xFFC09D63),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(
                    link,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: isNightMode ? Colors.white70 : Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(
              Icons.copy_rounded,
              size: 20,
              color: Color(0xFFC09D63),
            ),
            onPressed: onCopy,
            tooltip: 'نسخ',
          ),
        ],
      ),
    );
  }
}

class _ContactSheet extends StatelessWidget {
  const _ContactSheet();

  @override
  Widget build(BuildContext context) {
    final isNightMode = ThemeService().isNightMode;
    final bgColor = isNightMode
        ? const Color(0xFF4E342E)
        : const Color(0xFFFFF8E1);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        border: Border.all(color: const Color(0xFFE6C98A), width: 1.5),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFE6C98A).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'يسعدنا تواصلكِ عبر البريد الإلكتروني:',
            textAlign: TextAlign.center,
            style: AppTypography.arabic(fontSize: 18).copyWith(
              color: const Color(0xFFC09D63),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _LinkRow(
            link: 'contact.adhkarelmuslima@gmail.com',
            icon: Icons.email_outlined,
            isCentered: true,
            onCopy: () {
              Clipboard.setData(
                const ClipboardData(text: 'contact.adhkarelmuslima@gmail.com'),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('تم نسخ البريد الإلكتروني بنجاح'),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color(0xFF8D6E63),
                ),
              );
            },
            isNightMode: isNightMode,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
