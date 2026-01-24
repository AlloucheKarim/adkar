import 'package:flutter/material.dart';
import 'dart:math' as math;

class FlowerBloomPainter extends CustomPainter {
  final double progress;
  final Color color;

  FlowerBloomPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;
    final paint = Paint()
      ..color = color.withValues(alpha: 0.6 + (0.4 * progress))
      ..style = PaintingStyle.fill;

    // Center of the flower
    canvas.drawCircle(center, radius * 0.3 * progress, paint..color = const Color(0xFFE6C98A));

    // Petals
    const petalCount = 8;
    for (var i = 0; i < petalCount; i++) {
      final angle = (i * 2 * math.pi) / petalCount;
      final petalProgress = (progress * petalCount - i).clamp(0.0, 1.0);
      
      if (petalProgress > 0) {
        final petalSize = radius * 0.8 * petalProgress;
        final petalCenter = Offset(
          center.dx + radius * 0.6 * math.cos(angle) * progress,
          center.dy + radius * 0.6 * math.sin(angle) * progress,
        );

        _drawPetal(canvas, petalCenter, petalSize, angle, color);
      }
    }
  }

  void _drawPetal(Canvas canvas, Offset center, double size, double angle, Color color) {
    final paint = Paint()..color = color.withValues(alpha: 0.5);
    
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angle);
    
    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(size, -size, size * 2, 0);
    path.quadraticBezierTo(size, size, 0, 0);
    path.close();
    
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant FlowerBloomPainter oldDelegate) => oldDelegate.progress != progress;
}

class FlowerProgress extends StatelessWidget {
  final double progress;
  final double size;
  final Color color;

  const FlowerProgress({
    super.key,
    required this.progress,
    this.size = 60,
    this.color = const Color(0xFFF4C6D7),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: FlowerBloomPainter(progress: progress, color: color),
    );
  }
}
