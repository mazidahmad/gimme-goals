import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_icon_button.dart';

class AppValueChanger extends StatelessWidget {
  const AppValueChanger({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String title;
  final String subtitle;
  final double value;
  final void Function(double value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppTextStyle.headlineLarge(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIconButton(
              iconData: Icons.remove,
              onTap: () {
                onChanged.call(value - 1);
              },
            ),
            Gap(40.w),
            Text(
              value.toInt().toString(),
              style: AppTextStyle.headlineLarge()
                  .copyWith(fontSize: 100.sp, height: 0),
            ),
            Gap(40.w),
            AppIconButton(
              iconData: Icons.add,
              onTap: () {
                onChanged.call(value + 1);
              },
            ),
          ],
        ),
        Text(
          subtitle,
          style: AppTextStyle.headlineLarge(),
        ),
      ],
    );
  }
}
