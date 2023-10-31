import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_goals/core/theme/theme.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    required this.iconData,
    this.onTap,
    super.key,
  });

  final void Function()? onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        width: 50.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: AppColors.textColor.withOpacity(0.1),
        ),
        child: Icon(
          iconData,
          color: AppColors.textColor,
          size: 30.sp,
        ),
      ),
    );
  }
}
