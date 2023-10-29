import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/app_assets.dart';
import 'package:gimme_goals/core/theme/app_colors.dart';
import 'package:gimme_goals/core/theme/app_text_style.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_logo_widget.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

@RoutePage()
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  static const String routeName = '/on-boarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                AppAssets.onboardingBackground,
              ),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.gradient1,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: AppColors.backgroundColor,
                  ),
                )
              ],
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    Text(
                      'Welcome to',
                      style: AppTextStyle.headlineLarge(),
                    ),
                    Gap(5.h),
                    const AppLogoWidget(),
                    Gap(37.h),
                    AppPrimaryButton(
                      width: 244.w,
                      isLarge: true,
                      text: 'Get Started',
                      onPressed: () {
                        getIt<AppRouter>().replace(const LoginRoute());
                      },
                    ),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
