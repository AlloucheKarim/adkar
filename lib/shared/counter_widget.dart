import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/design_system.dart';

class CounterWidget extends StatelessWidget {
  final int currentCount;
  final int targetCount;
  final VoidCallback onTap;
  final VoidCallback onReset;

  const CounterWidget({
    super.key,
    required this.currentCount,
    required this.targetCount,
    required this.onTap,
    required this.onReset,
  });

  bool get isComplete => currentCount >= targetCount;

  @override
  Widget build(BuildContext context) {
    final progress = targetCount > 0
        ? (currentCount / targetCount).clamp(0.0, 1.0)
        : 0.0;

    return Column(
      children: [
        // Counter Button
        GestureDetector(
          onTap: isComplete
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  onTap();
                },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isComplete
                    ? [const Color(0xFF4CAF50), const Color(0xFF2E7D32)]
                    : [
                        AppColors.primary,
                        AppColors.primary.withValues(alpha: 0.7),
                      ],
              ),
              boxShadow: [
                BoxShadow(
                  color:
                      (isComplete ? const Color(0xFF4CAF50) : AppColors.primary)
                          .withValues(alpha: 0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Progress Ring
                SizedBox(
                  width: 140,
                  height: 140,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 6,
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
                // Counter Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isComplete ? '✓' : '$currentCount',
                      style: TextStyle(
                        fontSize: isComplete ? 48 : 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (!isComplete)
                      Text(
                        '/ $targetCount',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withValues(alpha: 0.8),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // Reset Button
        TextButton.icon(
          onPressed: currentCount > 0 ? onReset : null,
          icon: Icon(
            Icons.refresh,
            size: 18,
            color: currentCount > 0
                ? AppColors.accent
                : AppColors.textSecondary,
          ),
          label: Text(
            'إِعَادَةُ الْعَدَّادِ',
            style: TextStyle(
              color: currentCount > 0
                  ? AppColors.accent
                  : AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
