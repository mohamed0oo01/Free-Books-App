import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/Features/splash/presentaion/views/widgets/slideing_text.dart';
import 'package:movie_app/core/utils/app_router.dart';
import 'package:movie_app/core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset(assetsData.logo),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, _) {
            return sliding_code(slidingAnimation: slidingAnimation);
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 4), () {
      GoRouter.of(context).push(AppRouter.KHomeView);
    });
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween(
      begin: Offset(0, 2),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }
}
