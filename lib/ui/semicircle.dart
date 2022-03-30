import 'package:flutter/material.dart';
import 'dart:math' as math;

class SemiCircle extends CustomPainter {
  final Color color;

  const SemiCircle({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Path path = Path();
    path.addArc(rect, 0, -math.pi);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Progress extends CustomPainter {
  final DateTime sunrise;
  final DateTime sunset;
  final DateTime now;
  final Color color;

  Progress({
    required this.sunrise,
    required this.sunset,
    required this.now,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 20;

    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Path path = Path();

    final double percentage = (now.difference(sunrise).inMilliseconds /
            sunrise.difference(sunset).inMilliseconds) *
        100;
    path.addArc(rect, math.pi, -(math.pi / 100) * percentage);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
