import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_goals/core/theme/theme.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.hint = '',
    this.controller,
    this.prefixIcon,
    this.isObscured = false,
    this.validator,
    super.key,
  });

  final TextEditingController? controller;
  final String hint;
  final Widget? prefixIcon;
  final bool isObscured;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 17.h),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: AppTextStyle.bodyLarge(color: AppColors.hintTextColor)
            .copyWith(height: 0),
        fillColor: AppColors.textfieldBackgroundColor,
        focusColor: AppColors.textfieldBackgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.sp),
          borderSide: BorderSide.none,
        ),
        prefixIcon: prefixIcon,
      ),
      style: AppTextStyle.bodyLarge(color: AppColors.secondaryColor),
    );
  }
}
