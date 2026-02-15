import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/utils.dart';
import '../../core/design_system.dart';
import '../../shared/scaffold_with_background.dart';
import '../../core/theme_service.dart';
import '../../core/haptic_service.dart';

class SuratAlMulkScreen extends StatefulWidget {
  const SuratAlMulkScreen({super.key});

  @override
  State<SuratAlMulkScreen> createState() => _SuratAlMulkScreenState();
}

class _SuratAlMulkScreenState extends State<SuratAlMulkScreen> {
  double fontSizeMultiplier = 1.0;

  void _zoomIn() {
    setState(() {
      if (fontSizeMultiplier < 1.6) fontSizeMultiplier += 0.2;
    });
    HapticService().selectionClick();
  }

  void _zoomOut() {
    setState(() {
      if (fontSizeMultiplier > 0.8) fontSizeMultiplier -= 0.2;
    });
    HapticService().selectionClick();
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

        return ScaffoldWithBackground(
          appBar: AppBar(
            title: Text(
              'سُورَةُ الْمُلْكِ'.preventOrphan(),
              style: AppTypography.header(
                fontSize: 24,
              ).copyWith(color: primaryColor),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: BackButton(
              color: isNightMode
                  ? const Color(0xFFF5F5DC)
                  : const Color(0xFF5D4037),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.zoom_out,
                  size: 22,
                  color: Color(0xFFC09D63),
                ),
                onPressed: _zoomOut,
                tooltip: 'تصغير الخط',
              ),
              IconButton(
                icon: const Icon(
                  Icons.zoom_in,
                  size: 22,
                  color: Color(0xFFC09D63),
                ),
                onPressed: _zoomIn,
                tooltip: 'تكبير الخط',
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 20, 16, 60),
            child: Column(
              children: [
                // Mushaf Page Container
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isNightMode
                        ? const Color(0xFF4E342E).withValues(alpha: 0.4)
                        : const Color(0xFFFFFDF7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFE6C98A),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Stack(
                      children: [
                        // Decorative Corner Assets (Top Left)
                        Positioned(
                          top: -10,
                          left: -10,
                          child: Opacity(
                            opacity: 0.1,
                            child: Image.asset(
                              'assets/images/header_frame_a.png',
                              width: 100,
                            ),
                          ),
                        ),
                        // Decorative Corner Assets (Bottom Right)
                        Positioned(
                          bottom: -10,
                          right: -10,
                          child: Opacity(
                            opacity: 0.1,
                            child: Transform.rotate(
                              angle: 3.14159,
                              child: Image.asset(
                                'assets/images/header_frame_a.png',
                                width: 100,
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          child: Column(
                            children: [
                              // Surah Intro Tag
                              Text(
                                'الْمَانِعَةُ مِنْ عَذَابِ الْقَبْرِ'
                                    .preventOrphan(),
                                style: AppTypography.arabic(fontSize: 16)
                                    .copyWith(
                                      color: const Color(0xFFC09D63),
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const SizedBox(height: 24),

                              // Bismillah in a cartouche
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      isNightMode
                                          ? 'assets/images/dhikr_frame_night.png'
                                          : 'assets/images/dhikr_frame_day.png',
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                child: Text(
                                  'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ',
                                  textAlign: TextAlign.center,
                                  style: AppTypography.arabic(fontSize: 22)
                                      .copyWith(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Main Text
                              Text(
                                '''تَبَارَكَ الَّذِي بِيَدِهِ الْمُلْكُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ (1) الَّذِي خَلَقَ الْمَوْتَ وَالْحَيَاةَ لِيَبْلُوَكُمْ أَيُّكُمْ أَحْسَنُ عَمَلا وَهُوَ الْعَزِيزُ الْغَفُورُ (2) الَّذِي خَلَقَ سَبْعَ سَمَاوَاتٍ طِبَاقًا مَّا تَرَى فِي خَلْقِ الرَّحْمَنِ مِن تَفَاوُتٍ فَارْجِعِ الْبَصَرَ هَلْ تَرَى مِن فُطُورٍ (3) ثُمَّ ارْجِعِ الْبَصَرَ كَرَّتَيْنِ يَنقَلِبْ إِلَيْكَ الْبَصَرُ خَاسِئًا وَهُوَ حَسِيرٌ (4) وَلَقَدْ زَيَّنَّا السَّمَاء الدُّنْيَا بِمَصَابِيحَ وَجَعَلْنَاهَا رُجُومًا لِّلشَّيَاطِينِ وَأَعْتَدْنَا لَهُمْ عَذَابَ السَّعِيرِ (5) وَلِلَّذِينَ كَفَرُوا بِرَبِّهِمْ عَذَابُ جَهَنَّمَ وَبِئْسَ الْمَصِيرُ (6) إِذَا أُلْقُوا فِيهَا سَمِعُوا لَهَا شَهِيقًا وَهِيَ تَفُورُ (7) تَكَادُ تَمَيَّزُ مِنَ الْغَيْظِ كُلَّمَا أُلْقِيَ فِيهَا فَوْجٌ سَأَلَهُمْ خَزَنَتُهَا أَلَمْ يَأْتِكُمْ نَذِيرٌ (8) قَالُوا بَلَى قَدْ جَاءَنَا نَذِيرٌ فَكَذَّبْنَا وَقُلْنَا مَا نَزَّلَ اللَّهُ مِن شَيْءٍ إِنْ أَنتُمْ إِلاَّ فِي ضَلالٍ كَبِيرٍ (9) وَقَالُوا لَوْ كُنَّا نَسْمَعُ أَوْ نَعْقِلُ مَا كُنَّا فِي أَصْحَابِ السَّعِيرِ (10) فَاعْتَرَفُوا بِذَنبِهِمْ فَسُحْقًا لِّأَصْحَابِ السَّعِيرِ (11) إِنَّ الَّذِينَ يَخْشَوْنَ رَبَّهُم بِالْغَيْبِ لَهُم مَّغْفِرَةٌ وَأَجْرٌ كَبِيرٌ (12) وَأَسِرُّوا قَوْلَكُمْ أَوِ اجْهرُوا بِهِ إِنَّهُ عَلِيمٌ بِذَاتِ الصُّدُورِ (13) أَلا يَعْلَمُ مَنْ خَلَقَ وَهُوَ اللَّطِيفُ الْخَبِيرُ (14) هُوَ الَّذِي جَعَلَ لَكُمُ الأَرْضَ ذَلُولا فَامْشُوا فِي مَنَاكِبِهَا وَكُلُوا مِن رِّزْقِهِ وَإِلَيْهِ النُّشُورُ (15) أَأَمِنتُم مَّن فِي السَّمَاء أَن يَخْسِفَ بِكُمُ الأَرْضَ فَإِذَا هِيَ تَمُورُ (16) أَمْ أَمِنتُم مَّن فِي السَّمَاء أَن يُرْسِلَ عَلَيْكُمْ حَاصِبًا فَسَتَعْلَمُونَ كَيْفَ نَذِيرِ (17) وَلَقَدْ كَذَّبَ الَّذِينَ مِن قَبْلِهِمْ فَكَيْفَ كَانَ نَكِيرِ (18) أَوَلَمْ يَرَوْا إِلَى الطَّيْرِ فَوْقَهُمْ صَافَّاتٍ وَيَقْبِضْنَ مَا يُمْسِكُهُنَّ إِلاَّ الرَّحْمَنُ إِنَّهُ بِكُلِّ شَيْءٍ بَصِيرٌ (19) أَمَّنْ هَذَا الَّذِي هُوَ جُندٌ لَّكُمْ يَنصُرُكُم مِّن دُونِ الرَّحْمَنِ إِنِ الْكَافِرُونَ إِلاَّ فِي غُرُورٍ (20) أَمَّنْ هَذَا الَّذِي يَرْزُقُكُمْ إِنْ أَمْسَكَ رِزْقَهُ بَل لَّجُّوا فِي عُتُوٍّ وَنُفُورٍ (21) أَفَمَن يَمْشِي مُكِبًّا عَلَى وَجْهِهِ أَهْدَى أَمَّن يَمْشِي سَوِيًّا عَلَى صِرَاطٍ مُّسْتَقِيمٍ (22) قُلْ هُوَ الَّذِي أَنشَأَكُمْ وَجَعَلَ لَكُمُ السَّمْعَ وَالأَبْصَارَ وَالأَفْئِدَةَ قَلِيلا مَّا تَشْكُرُونَ (23) قُلْ هُوَ الَّذِي ذَرَأَكُمْ فِي الأَرْضِ وَإِلَيْهِ تُحْشَرُونَ (24) وَيَقُولُونَ مَتَى هَذَا الْوَعْدُ إِن كُنتُمْ صَادِقِينَ (25) قُلْ إِنَّمَا الْعِلْمُ عِندَ اللَّهِ وَإِنَّمَا أَنَا نَذِيرٌ مُّبِينٌ (26) فَلَمَّا رَأَوْهُ زُلْفَةً سِيئَتْ وُجُوهُ الَّذِينَ كَفَرُوا وَقِيلَ هَذَا الَّذِي كُنتُم بِهِ تَدَّعُونَ (27) قُلْ أَرَأَيْتُمْ إِنْ أَهْلَكَنِيَ اللَّهُ وَمَن مَّعِيَ أَوْ رَحِمَنَا فَمَن يُجِيرُ الْكَافِرِينَ مِنْ عَذَابٍ أَلِيمٍ (28) قُلْ هُوَ الرَّحْمَنُ آمَنَّا بِهِ وَعَلَيْهِ تَوَكَّلْنَا فَسَتَعْلَمُونَ مَنْ هُوَ فِي ضَلالٍ مُّبِينٍ (29) قُلْ أَرَأَيْتُمْ إِنْ أَصْبَحَ مَاؤُكُمْ غَوْرًا فَمَن يَأْتِيكُم بِمَاء مَّعِينٍ (30)''',
                                textAlign: TextAlign.center,
                                style: AppTypography.arabic(
                                  fontSize: 22 * fontSizeMultiplier,
                                ).copyWith(color: primaryColor, height: 2.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
