import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class SplasViewhBody extends StatefulWidget {
  const SplasViewhBody({super.key});

  @override
  State<SplasViewhBody> createState() => _SplasViewhBodyState();
}

class _SplasViewhBodyState extends State<SplasViewhBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateHome(context);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetData.logo),
        const SizedBox(height: 20),
        SlidingTextAnimation(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 9),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    animationController.forward();
  }
}

void navigateHome(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 3),
    () {
      // Get.to(() => const HomeView(),
      //     transition: Transition.fade,
      //     duration: const Duration(milliseconds: 500));
      GoRouter.of(context).go(AppRouter.kHome);
    },
  );
}
