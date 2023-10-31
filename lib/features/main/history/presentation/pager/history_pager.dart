import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/core/util/date_util.dart';
import 'package:gimme_goals/features/global/data/models/body_mass_model.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_box_card.dart';
import 'package:gimme_goals/features/main/history/presentation/cubit/history_cubit.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/home_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

class HistoryPager extends StatelessWidget with MessagerMixin {
  HistoryPager({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        children: [
          Gap(20.h),
          Text(
            'Your Body Mass Histories',
            style: AppTextStyle.headlineLarge(),
          ),
          Gap(20.h),
          BlocConsumer<HistoryCubit, HistoryState>(
            listener: (context, state) {
              if (state is HistoryFailed) {
                showAppToast(
                    message: state.failure.message, type: ToastType.error);
              }
            },
            builder: (context, state) {
              if (state is HistoryLoading) {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (state is HistoryLoaded) {
                if (state.histories.isEmpty) {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "You don't write body mass yet",
                        style: AppTextStyle.headlineMedium(),
                      ),
                    ),
                  );
                }
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.histories.length,
                    itemBuilder: (context, index) {
                      var history = state.histories[index];
                      var date = history.date.getDateTime();
                      return HistoryListItem(date: date, history: history);
                    },
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}

class HistoryListItem extends StatelessWidget {
  const HistoryListItem({
    super.key,
    required this.date,
    required this.history,
  });

  final DateTime date;
  final BodyMassModel history;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await getIt<AppRouter>()
          .push(CUDBodyMassRoute(bodyMass: history))
          .then((value) {
        if (value == true) {
          context.read<HistoryCubit>().fetchHistories();
          context.read<HomeCubit>().getTodayBodyMass();
        }
      }),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.sp),
            color: AppColors.textColor.withOpacity(0.1)),
        child: Row(
          children: [
            AppBoxCard(
              backgroundColor: Colors.transparent,
              value: date.day.toString(),
              title: DateUtil.getStringMonth(date),
              subtitle: date.year.toString(),
            ),
            const Spacer(),
            AppBoxCard(
                value: history.weight.toInt().toString(),
                title: 'Weight',
                subtitle: 'Kg'),
            Gap(12.w),
            AppBoxCard(
                value: history.height.toInt().toString(),
                title: 'Height',
                subtitle: 'Cm'),
          ],
        ),
      ),
    );
  }
}
