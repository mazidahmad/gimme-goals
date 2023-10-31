import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/home_cubit.dart';
import 'package:gimme_goals/features/main/home/presentation/widget/body_mass_goals_widget.dart';
import 'package:gimme_goals/features/main/home/presentation/widget/home_header_widget.dart';
import 'package:gimme_goals/features/main/home/presentation/widget/today_body_mass_status_widget.dart';

class HomePager extends StatelessWidget with MessagerMixin {
  HomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStateStatus.failed) {
          showAppToast(message: state.failure!.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              const HomeHeaderWidget(),
              const Spacer(),
              Text(
                'Body Mass Goals',
                style: AppTextStyle.headlineMedium(),
              ),
              Gap(20.h),
              if (state.status == HomeStateStatus.loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (state.status == HomeStateStatus.loaded)
                BodyMassGoalsWidget(goal: state.goal),
              Gap(40.h),
              Text(
                'Today Body Mass',
                style: AppTextStyle.headlineMedium(),
              ),
              Gap(20.h),
              if (state.status == HomeStateStatus.loading)
                const Center(
                  child: CircularProgressIndicator(),
                ),
              if (state.status == HomeStateStatus.loaded)
                TodayBodyMassStatusWidget(bodyMass: state.todayBodyMass),
              const Spacer(),
            ],
          ),
        );
      },
    );
  }
}
