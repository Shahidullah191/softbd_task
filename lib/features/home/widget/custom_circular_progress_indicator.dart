import 'package:flutter/material.dart';

class GradientCircularProgressPainter extends CustomPainter {
  final double value;

  GradientCircularProgressPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Create a linear gradient from bottom center to left
    final Paint gradientPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..shader = const LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color(0xff336F4A),
          Color(0xff86B560),
        ],
      ).createShader(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2));

    // Draw the background circle
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, backgroundPaint);

    // Draw the progress arc
    double sweepAngle = value * 2 * 3.141592653589793; // Convert to radians
    canvas.drawArc(
      Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: size.width / 2),
      3.141592653589793 / 2, // Start angle (bottom)
      sweepAngle,
      false,
      gradientPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}