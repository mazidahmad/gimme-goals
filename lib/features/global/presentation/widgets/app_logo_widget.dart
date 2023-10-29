import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_goals/core/theme/theme.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'app_logo',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
                text: 'GIMME',
                style: AppTextStyle.displayLarge(color: AppColors.primaryColor)
                    .copyWith(fontSize: 42.sp),
                children: [
                  TextSpan(
                    text: 'GOALS',
                    style: AppTextStyle.displayLarge()
                        .copyWith(fontSize: 42.sp, height: 1),
                  ),
                ]),
          ),
          Text(
            'Achieve your body goals with us',
            style: AppTextStyle.bodyMedium(),
          )
        ],
      ),
    );
  }
}
