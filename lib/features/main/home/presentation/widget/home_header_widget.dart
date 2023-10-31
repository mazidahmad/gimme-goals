import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_avatar.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Hello, ',
                style:
                    AppTextStyle.headlineMedium(color: AppColors.primaryColor),
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
    );
  }
}
