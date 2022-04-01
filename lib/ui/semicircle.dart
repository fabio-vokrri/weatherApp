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

    const Rect rect = Rect.fromLTWH(0, 0, 300, 300);
    final Path path = Path();
    path.addArc(rect, math.pi, math.pi);
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

    const Rect rect = Rect.fromLTWH(0, 0, 300, 300);
    final Path path = Path();

    final bool _isDay = now.isAfter(sunrise) && now.isBefore(sunset);
    final double _progress = (_isDay)
        ? (now.difference(sunrise).inSeconds /
            (sunset.difference(sunrise).inSeconds))
        : 0;

    path.addArc(rect, math.pi, math.pi * _progress);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
