import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/theme/theme.dart';

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
                SizedBox(
                  height: 40.h,
                  width: 40.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.sp),
                    child: Image(
                      image: const AssetImage(
                        AppAssets.avatarMan,
                      ),
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                ),
              ],
            ),
            Gap(20.h),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: AppColors.textColor.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Weight',
                        style: AppTextStyle.headlineSmall().copyWith(height: 0),
                      ),
                      Text(
                        '72',
                        style: AppTextStyle.displayLarge().copyWith(height: 0),
                      ),
                    ],
                  ),
                ),
                Gap(12.w),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: AppColors.textColor.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Height',
                        style: AppTextStyle.headlineSmall().copyWith(height: 0),
                      ),
                      Text(
                        '180',
                        style: AppTextStyle.displayLarge().copyWith(height: 0),
                      ),
                      Text(
                        'cm',
                        style: AppTextStyle.bodySmall(),
                      ),
                    ],
                  ),
                ),
                Gap(12.w),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.sp),
                    color: AppColors.textColor.withOpacity(0.1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Age',
                        style: AppTextStyle.headlineSmall().copyWith(height: 0),
                      ),
                      Text(
                        '26',
                        style: AppTextStyle.displayLarge().copyWith(height: 0),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
