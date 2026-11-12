
import 'package:flutter/material.dart';

class FadeInLeftToRight extends StatefulWidget {
  final Widget child;

  const FadeInLeftToRight({
    super.key,
    required this.child,
  });

  @override
  State<FadeInLeftToRight> createState() =>
      _FadeInLeftToRightState();
}

class _FadeInLeftToRightState
    extends State<FadeInLeftToRight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: _animation.value,
            child: Opacity(
              opacity: _animation.value,
              child: child,
            ),
          ),
        );
      },
      child: widget.child,
    );
  }
}
