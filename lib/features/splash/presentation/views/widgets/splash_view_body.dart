import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/widgets/slider_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController; // 0 or 1
  late Animation<Offset> slidingAnimation; // offset ==> x and y

  @override
  void initState() {
    super.initState();

    initStateAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose(); // using when widget never build again
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assets.logo),
        const SizedBox(
          height: 5,
        ),
        SliderAnimation(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initStateAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 50), end: const Offset(0, 0))
            .animate(animationController);

    animationController.forward(); // do step by step (tick by tick)
  }

  void navigateToHome() {
    Future.delayed(kPrimaryDuration, () {
      Get.to(HomeView(), transition: Transition.fade);
    });
  }
}
