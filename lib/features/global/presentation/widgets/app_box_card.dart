import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_goals/core/theme/theme.dart';

class AppBoxCard extends StatelessWidget {
  const AppBoxCard({
    required this.value,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
    super.key,
  });

  final String value;
  final String title;
  final String subtitle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sp),
        color: backgroundColor ?? AppColors.textColor.withOpacity(0.1),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyle.headlineSmall().copyWith(height: 0),
          ),
          Text(
            value,
            style: AppTextStyle.displayLarge().copyWith(height: 0),
          ),
          Text(
            subtitle,
            style: AppTextStyle.bodySmall(),
          ),
        ],
      ),
    );
  }
}
