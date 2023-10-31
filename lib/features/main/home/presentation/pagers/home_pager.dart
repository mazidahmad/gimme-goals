import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_avatar.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_box_card.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/home_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

class HomePager extends StatelessWidget with MessagerMixin {
  HomePager({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state.status == HomeStateStatus.failed) {
            showAppToast(
                message: state.failure!.message, type: ToastType.error);
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
                  'Today Body Mass Status',
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
      ),
    );
  }
}

class TodayBodyMassStatusWidget extends StatelessWidget {
  const TodayBodyMassStatusWidget({
    this.bodyMass,
    super.key,
  });

  final BodyMassModel? bodyMass;

  @override
  Widget build(BuildContext context) {
    if (bodyMass != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBoxCard(
              title: "Weight",
              value: bodyMass!.weight.toInt().toString(),
              subtitle: "Kg"),
          Gap(12.w),
          AppBoxCard(
              title: "Height",
              value: bodyMass!.height.toInt().toString(),
              subtitle: "cm"),
        ],
      );
    }
    return GestureDetector(
      onTap: () => getIt<AppRouter>().push(const AddBodyMassRoute()),
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
            Text(
              "You don't write today body mass yet",
              style: AppTextStyle.headlineSmall(),
            ),
            Gap(12.h),
            Icon(
              Icons.add_box_outlined,
              color: AppColors.textColor,
              size: 40.sp,
            ),
            Gap(12.h),
            Text(
              "Write Today Body Mass",
              style: AppTextStyle.headlineSmall(),
            )
          ],
        ),
      ),
    );
  }
}

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
    );
  }
}
