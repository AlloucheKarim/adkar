import 'package:flutter/material.dart';
import '../core/theme_service.dart';

class ScaffoldWithBackground extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final Color? backgroundColor;
  final String? backgroundImage;

  const ScaffoldWithBackground({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeService(),
      builder: (context, _) {
        final isNightMode = ThemeService().isNightMode;
        // If a specific background is provided, use it. Otherwise use the theme default.
        final effectiveBackgroundImage =
            backgroundImage ??
            (isNightMode
                ? 'assets/images/background_night.jpg'
                : 'assets/images/background_v3.png');

        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(effectiveBackgroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            color: backgroundColor ?? Colors.transparent,
            child: Stack(
              children: [
                // Bokeh Overlay
                if (backgroundColor != null &&
                    backgroundColor != Colors.transparent)
                  Positioned.fill(
                    child: _BokehOverlay(color: backgroundColor!),
                  ),
                Scaffold(
                  backgroundColor:
                      Colors.transparent, // Important pour voir le fond
                  appBar: appBar,
                  extendBodyBehindAppBar: extendBodyBehindAppBar,
                  body: body,
                  floatingActionButton: floatingActionButton,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BokehOverlay extends StatelessWidget {
  final Color color;
  const _BokehOverlay({required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(painter: _BokehPainter(color: color));
  }
}

class _BokehPainter extends CustomPainter {
  final Color color;
  _BokehPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withValues(alpha: 0.2)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    final random = BokehRandom(42); // Seeded for consistency
    for (var i = 0; i < 15; i++) {
      final centerX = random.nextDouble() * size.width;
      final centerY = random.nextDouble() * size.height;
      final radius = 20.0 + random.nextDouble() * 40.0;
      canvas.drawCircle(Offset(centerX, centerY), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Pseudo-random helper if dart:math Random feels overkill or for specific behavior
class BokehRandom {
  int _seed;
  BokehRandom(this._seed);
  double nextDouble() {
    _seed = (_seed * 1103515245 + 12345) & 0x7fffffff;
    return _seed / 2147483647.0;
  }
}
