import 'package:flutter/material.dart';
import 'shimmer_config.dart';

/// Custom painter for shimmer effect
class ShimmerPainter extends CustomPainter {
  final double progress;
  final Color baseColor;
  final Color highlightColor;
  final ShimmerDirection direction;

  ShimmerPainter({
    required this.progress,
    required this.baseColor,
    required this.highlightColor,
    required this.direction,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw base color
    paint.color = baseColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Calculate gradient positions based on direction
    Offset begin, end;
    switch (direction) {
      case ShimmerDirection.leftToRight:
        begin = Offset(-size.width, 0);
        end = Offset(size.width * 2, 0);
        break;
      case ShimmerDirection.rightToLeft:
        begin = Offset(size.width * 2, 0);
        end = Offset(-size.width, 0);
        break;
      case ShimmerDirection.topToBottom:
        begin = Offset(0, -size.height);
        end = Offset(0, size.height * 2);
        break;
      case ShimmerDirection.bottomToTop:
        begin = Offset(0, size.height * 2);
        end = Offset(0, -size.height);
        break;
    }

    // Create gradient
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [baseColor, highlightColor, baseColor],
      stops: const [0.0, 0.5, 1.0],
    );

    // Calculate shader rect based on progress and direction
    Rect shaderRect;
    switch (direction) {
      case ShimmerDirection.leftToRight:
        shaderRect = Rect.fromLTWH(
          begin.dx + (end.dx - begin.dx) * progress,
          0,
          size.width,
          size.height,
        );
        break;
      case ShimmerDirection.rightToLeft:
        shaderRect = Rect.fromLTWH(
          begin.dx + (end.dx - begin.dx) * progress,
          0,
          size.width,
          size.height,
        );
        break;
      case ShimmerDirection.topToBottom:
        shaderRect = Rect.fromLTWH(
          0,
          begin.dy + (end.dy - begin.dy) * progress,
          size.width,
          size.height,
        );
        break;
      case ShimmerDirection.bottomToTop:
        shaderRect = Rect.fromLTWH(
          0,
          begin.dy + (end.dy - begin.dy) * progress,
          size.width,
          size.height,
        );
        break;
    }

    paint.shader = gradient.createShader(shaderRect);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(ShimmerPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.baseColor != baseColor ||
        oldDelegate.highlightColor != highlightColor ||
        oldDelegate.direction != direction;
  }
}
