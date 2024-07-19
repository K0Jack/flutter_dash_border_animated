import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dash_border_animated/src/dash_border_run_type.dart';

class DashBorderPainter extends CustomPainter {
  DashBorderPainter({
    required this.animationValue,
    required this.dashColor,
    required this.dashRunType,
    this.strokeWidth = 5,
    this.dashWidth = 10,
    this.dashSpace = 5,
  });

  final double animationValue;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;

  final Color dashColor;

  final DashBorderRunType dashRunType;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = dashColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double dashWidthLocal = dashWidth;
    double dashSpaceLocal = dashSpace;
    double distance = animationValue * (dashWidthLocal + dashSpaceLocal);

    switch (dashRunType) {
      /// Dash Border normal case

      case DashBorderRunType.rectangle:
        buildDashRunRectangle(
          paint,
          canvas,
          size,
          distance,
          dashWidthLocal,
          dashSpaceLocal,
        );
        break;

      /// Dash Border with rounded
      case DashBorderRunType.rectanglePip:
        buildDashRunRectangleRounded(paint, canvas, size, distance);

        break;

      /// Dash run like a Circle
      case DashBorderRunType.circle:
        buildDashRunCircle(paint, canvas, size, distance);
        break;
      case DashBorderRunType.rectangleRounded:
        // TODO: Handle this case.
        break;
    }
  }

  void buildDashRunRectangle(
    Paint paint,
    Canvas canvas,
    Size size,
    double distance,
    double dashWidthLocal,
    double dashSpaceLocal,
  ) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    for (final pathMetric in path.computeMetrics()) {
      double pathLength = pathMetric.length;
      while (distance < pathLength) {
        final double nextDashEnd = distance + dashWidthLocal;
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
        distance += dashWidthLocal + dashSpaceLocal;
      }
      distance -= pathLength;
    }
  }

  void buildDashRunRectangleRounded(
    Paint paint,
    Canvas canvas,
    Size size,
    double distance,
  ) {
    final cornerPaths = [
      // Top-left corner
      Path()
        ..moveTo(0, 0)
        ..lineTo(size.width * 0.2, 0),
      Path()
        ..moveTo(0, 0)
        ..lineTo(0, size.height * 0.2),

      // Top-right corner
      Path()
        ..moveTo(size.width, 0)
        ..lineTo(size.width * 0.8, 0),
      Path()
        ..moveTo(size.width, 0)
        ..lineTo(size.width, size.height * 0.2),

      // Bottom-right corner
      Path()
        ..moveTo(size.width, size.height)
        ..lineTo(size.width * 0.8, size.height),
      Path()
        ..moveTo(size.width, size.height)
        ..lineTo(size.width, size.height * 0.8),

      // Bottom-left corner
      Path()
        ..moveTo(0, size.height)
        ..lineTo(size.width * 0.2, size.height),
      Path()
        ..moveTo(0, size.height)
        ..lineTo(0, size.height * 0.8),
    ];

    for (var path in cornerPaths) {
      for (PathMetric pathMetric in path.computeMetrics()) {
        double pathLength = pathMetric.length;
        while (distance < pathLength) {
          canvas.drawPath(
            pathMetric.extractPath(
              distance % pathLength,
              (distance + dashWidth) % pathLength,
            ),
            paint,
          );
          distance += dashWidth + dashSpace;
        }
        distance -= pathLength; // Ensure continuous animation
      }
    }
  }

  void buildDashRunCircle(
    Paint paint,
    Canvas canvas,
    Size size,
    double distance,
  ) {
    final radius = size.width / 2;
    final center = Offset(size.width / 2, size.height / 2);

    final circlePath = Path()
      ..addOval(Rect.fromCircle(center: center, radius: radius));

    for (PathMetric pathMetric in circlePath.computeMetrics()) {
      double pathLength = pathMetric.length;
      while (distance < pathLength) {
        canvas.drawPath(
          pathMetric.extractPath(
            distance % pathLength,
            (distance + dashWidth) % pathLength,
          ),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant DashBorderPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
