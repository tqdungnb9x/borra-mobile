import 'dart:async';

import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  // Widget will use this animation
  final Widget child;
  const LogoAnimation({super.key, required this.child});

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;
  startTime() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    // MainBloc.authBloc.add(const AuthEventInitial());
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    animation.addListener(() => setState(() {}));
    animationController.forward();

    startTime();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
