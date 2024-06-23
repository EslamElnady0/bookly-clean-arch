import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  final Widget child;
  const CustomFadingWidget({super.key, required this.child});

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animation =
        Tween<double>(begin: 0.2, end: 0.8).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: _animation.value, child: widget.child);
  }
}
