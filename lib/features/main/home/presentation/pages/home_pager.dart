import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_avatar.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_box_card.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

class HomePager extends StatelessWidget {
  const HomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hello, ',
                        style: AppTextStyle.headlineMedium(),
                        children: [
                          TextSpan(
                            text: 'Mazid!',
                            style: AppTextStyle.headlineMedium(
                                color: AppColors.primaryColor),
                          )
                        ],
                      ),
                    ),
                    Gap(4.h),
                    Text(
                      "Let's start your day",
                      style: AppTextStyle.headlineLarge(),
                    )
                  ],
                ),
                GestureDetector(
                    onTap: () => getIt<AppRouter>().push(
                          const ProfileRoute(),
                        ),
                    child: const AppAvatar()),
              ],
            ),
            Gap(20.h),
            Text(
              'Current Status',
              style: AppTextStyle.headlineMedium(),
            ),
            Gap(20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppBoxCard(title: "Weight", value: "72", subtitle: "Kg"),
                Gap(12.w),
                const AppBoxCard(title: "Height", value: "180", subtitle: "cm"),
                Gap(12.w),
                const AppBoxCard(title: "Age", value: "26", subtitle: "years"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
