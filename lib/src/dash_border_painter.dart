import 'package:flutter/material.dart';

class DashBorderPainter extends CustomPainter {
  DashBorderPainter({
    required this.animationValue,
    required this.dashColor,
    this.strokeWidth = 5,
    this.dashWidth = 10,
    this.dashSpace = 5,
  });

  final double animationValue;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  final Color dashColor;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dashColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    double _dashWidth = dashWidth;
    double _dashSpace = dashSpace;
    double distance = animationValue * (_dashWidth + _dashSpace);

    for (final pathMetric in path.computeMetrics()) {
      double pathLength = pathMetric.length;
      while (distance < pathLength) {
        final double nextDashEnd = distance + _dashWidth;
        if (nextDashEnd > pathLength) {
          break;
        }
        canvas.drawPath(
          pathMetric.extractPath(
            distance,
            nextDashEnd,
          ),
          paint,
        );
        distance += _dashWidth + _dashSpace;
      }
      distance -= pathLength;
    }
  }

  @override
  bool shouldRepaint(covariant DashBorderPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
