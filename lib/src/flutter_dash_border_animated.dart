import 'package:flutter/material.dart';
import 'package:flutter_dash_border_animated/src/dash_border_run_type.dart';

import 'dash_border_painter.dart';

class DashBorderAnimated extends StatefulWidget {
  const DashBorderAnimated({
    super.key,
    this.dashColor = Colors.pink,
    this.animatedSpeed,
    this.strokeWidth = 5,
    this.dashWidth = 10,
    this.dashSpace = 5,
    this.child,
    this.dashRunType = DashBorderRunType.rectangle,
    this.isPause = false,
  });

  /// Height of dash, if you want it be bigger than default value just add value you want
  final double strokeWidth;

  /// Width of dash, if you want it be bigger than default value just add value you want
  final double dashWidth;

  /// Space of dash to dash, if you want it be bigger than default value just add value you want
  final double dashSpace;

  /// Pause animated, default it's always true
  final bool isPause;

  /// Border Color
  final Color dashColor;

  /// The speed of dash, it will run around
  final Duration? animatedSpeed;

  /// Type of Dash, dash gets animated with type from [DashBorderRunType]. Normal case is [DashBorderRunType.rectangle]
  final DashBorderRunType dashRunType;

  /// Child item when you want do something inside
  final Widget? child;

  @override
  DashBorderAnimatedState createState() => DashBorderAnimatedState();
}

class DashBorderAnimatedState extends State<DashBorderAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.animatedSpeed ?? const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isPause) {
      return CustomPaint(
        painter: DashBorderPainter(
          animationValue: _animation.value,
          dashColor: widget.dashColor,
          dashWidth: widget.dashWidth,
          dashSpace: widget.dashSpace,
          strokeWidth: widget.strokeWidth,
          dashRunType: widget.dashRunType,
        ),
        child: widget.child,
      );
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: DashBorderPainter(
            animationValue: _animation.value,
            dashColor: widget.dashColor,
            dashWidth: widget.dashWidth,
            dashSpace: widget.dashSpace,
            strokeWidth: widget.strokeWidth,
            dashRunType: widget.dashRunType,
          ),
          child: widget.child,
        );
      },
    );
  }
}
