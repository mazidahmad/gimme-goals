import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_logo_widget.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_text_form_field.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

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
                  flex: 2,
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Spacer(
                        flex: 3,
                      ),
                      Gap(5.h),
                      const AppLogoWidget(),
                      Gap(37.h),
                      Form(
                        child: Column(
                          children: [
                            const AppTextFormField(
                              hint: 'Email',
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: AppColors.hintTextColor,
                              ),
                            ),
                            Gap(20.h),
                            const AppTextFormField(
                              hint: 'Password',
                              isObscured: true,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: AppColors.hintTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(37.h),
                      AppPrimaryButton(
                        width: double.infinity,
                        text: 'Sign In',
                        onPressed: () {},
                      ),
                      Gap(42.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Didn't have any account? ",
                            style: AppTextStyle.bodyLarge(),
                          ),
                          GestureDetector(
                            onTap: () {
                              getIt<AppRouter>().replace(const RegisterRoute());
                            },
                            child: Text(
                              "Sign Up",
                              style: AppTextStyle.headlineMedium(
                                  color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
