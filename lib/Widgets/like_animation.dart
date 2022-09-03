import 'package:flutter/material.dart';

class Likeanimation extends StatefulWidget {
  final Widget child;
  final bool IsAnimating;
  final Duration duration;
  final VoidCallback? onEnd;
  final bool smalllike;

  const Likeanimation({
    Key? key,
    required this.child,
    required this.IsAnimating,
    this.duration = const Duration(milliseconds: 150),
    this.onEnd,
    this.smalllike = false,
  }) : super(key: key);

  @override
  State<Likeanimation> createState() => _LikeanimationState();
}

class _LikeanimationState extends State<Likeanimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2));

    scale = Tween<double>(begin: 1, end: 1.2).animate(controller);
  }

  @override
  void didUpdateWidget(covariant Likeanimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.IsAnimating != oldWidget.IsAnimating) {
      startAnimation();
    }
  }

  startAnimation() async {
    if (widget.IsAnimating || widget.smalllike) {
      await controller.forward();
      await controller.reverse();

      await Future.delayed(
        const Duration(milliseconds: 200),
      );

      if (widget.onEnd != null) {
        widget.onEnd!();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: scale, child: widget.child);
  }
}
