import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.onDone});
  final VoidCallback onDone;

  PageViewModel _page(
    BuildContext context,
    String title,
    String body,
    IconData icon,
    Color color,
  ) => PageViewModel(
    title: title,
    body: body,
    image: Container(
      width: 230,
      height: 230,
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        shape: BoxShape.circle,
      ),
      child: Center(child: Icon(icon, size: 105, color: color)),
    ),
    decoration: PageDecoration(
      titleTextStyle: Theme.of(context).textTheme.headlineSmall!
          .copyWith(fontWeight: FontWeight.w800),
      bodyTextStyle: Theme.of(context).textTheme.bodyLarge!
          .copyWith(height: 1.5),
      imagePadding: const EdgeInsets.only(top: 50, bottom: 30),
      bodyPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
    ),
  );

  @override
  Widget build(BuildContext context) => IntroductionScreen(
    pages: [
      _page(
        context,
        'intro_1_title'.tr(),
        'intro_1_body'.tr(),
        Icons.storefront_rounded,
        const Color(0xFF5B5BD6),
      ),
      _page(
        context,
        'intro_2_title'.tr(),
        'intro_2_body'.tr(),
        Icons.local_shipping_rounded,
        const Color(0xFFEF9B45),
      ),
      _page(
        context,
        'intro_3_title'.tr(),
        'intro_3_body'.tr(),
        Icons.favorite_rounded,
        const Color(0xFFDB6488),
      ),
    ],
    showSkipButton: true,
    skip: Text('skip'.tr()),
    next: const Icon(Icons.arrow_forward_rounded),
    done: Text(
      'done'.tr(),
      style: const TextStyle(fontWeight: FontWeight.w700),
    ),
    onSkip: onDone,
    onDone: onDone,
    dotsDecorator: DotsDecorator(
      activeColor: Theme.of(context).colorScheme.primary,
      activeSize: const Size(22, 9),
      activeShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
