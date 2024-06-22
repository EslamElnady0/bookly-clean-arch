import 'package:bookly/core/util/app_router.dart';
import 'package:bookly/core/util/extentions.dart';
import 'package:bookly/features/splash/presentation/views/widgets/silding_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset("assets/images/Logo.png"),
        const SizedBox(
          height: 5,
        ),
        SlidingText(slidingAnimation: _slidingAnimation),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      context.goTo(AppRouter.home);
    });
  }

  void initSlidingAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 2),
      end: const Offset(0, 0),
    ).animate(_animationController);
    _animationController.forward();
  }
}
