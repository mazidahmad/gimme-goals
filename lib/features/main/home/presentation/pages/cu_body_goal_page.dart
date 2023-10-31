import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_value_changer.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/cu_body_goal_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';

@RoutePage()
class CUBodyGoalPage extends StatefulWidget {
  const CUBodyGoalPage({this.goal, super.key});

  static const String routeName = '/add-body-goal';

  final GoalModel? goal;

  @override
  State<CUBodyGoalPage> createState() => _CUBodyGoalPageState();
}

class _CUBodyGoalPageState extends State<CUBodyGoalPage> with MessagerMixin {
  late final CUBodyGoalCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<CUBodyGoalCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..initialize(widget.goal),
      child: Scaffold(
        appBar: AppBar(
          title: Text('${(widget.goal != null) ? "Edit" : "Create"} Body Goal'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AppPrimaryButton(
          text: '${(widget.goal != null) ? "Edit" : "Create"} Body Goal',
          onPressed: () {
            (widget.goal != null)
                ? _cubit.updateBodyGoal(widget.goal!)
                : _cubit.addBodyGoal();
          },
        ),
        body: BlocConsumer<CUBodyGoalCubit, CUBodyGoalState>(
          listener: (context, state) async {
            if (state.status == CUBodyGoalStateStatus.loading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();

              if (state.status == CUBodyGoalStateStatus.failed) {
                showAppToast(
                    message: state.failure!.message, type: ToastType.error);
              } else if (state.status == CUBodyGoalStateStatus.success) {
                await getIt<AppRouter>().pop(true);
              }
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppValueChanger(
                      title: 'Weight',
                      subtitle: 'Kg',
                      value: state.weight,
                      onChanged: (value) => _cubit.changeWeight(value),
                    ),
                    Gap(50.h),
                    AppValueChanger(
                      title: 'Height',
                      subtitle: 'Cm',
                      value: state.height,
                      onChanged: (value) => _cubit.changeHeight(value),
                    ),
                    Gap(100.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
