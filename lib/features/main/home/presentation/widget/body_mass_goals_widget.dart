import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_box_card.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/home_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

class BodyMassGoalsWidget extends StatelessWidget {
  const BodyMassGoalsWidget({
    this.goal,
    super.key,
  });

  final GoalModel? goal;

  @override
  Widget build(BuildContext context) {
    if (goal != null) {
      return GestureDetector(
        onTap: () =>
            getIt<AppRouter>().push(CUBodyGoalRoute(goal: goal)).then((value) {
          if (value == true) {
            context.read<HomeCubit>().getTodayBodyMass();
          }
        }),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: AppColors.textColor.withOpacity(0.1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBoxCard(
                  title: "Weight",
                  backgroundColor: AppColors.textColor,
                  textColor: AppColors.secondaryTextColor,
                  value: goal!.weight.toInt().toString(),
                  subtitle: "Kg"),
              Gap(12.w),
              AppBoxCard(
                  title: "Height",
                  backgroundColor: AppColors.textColor,
                  textColor: AppColors.secondaryTextColor,
                  value: goal!.height.toInt().toString(),
                  subtitle: "cm"),
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: () => getIt<AppRouter>().push(CUBodyGoalRoute()).then((value) {
        if (value == true) {
          context.read<HomeCubit>().getTodayBodyMass();
        }
      }),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: AppColors.textColor.withOpacity(0.05),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_box_outlined,
              color: AppColors.textColor,
              size: 40.sp,
            ),
            Gap(12.h),
            Text(
              "Set Your Body Mass Goal",
              style: AppTextStyle.headlineSmall(),
            )
          ],
        ),
      ),
    );
  }
}
