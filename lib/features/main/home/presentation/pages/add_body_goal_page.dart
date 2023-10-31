import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_value_changer.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/add_body_goal_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';

@RoutePage()
class AddBodyGoalPage extends StatefulWidget {
  const AddBodyGoalPage({super.key});

  static const String routeName = '/add-body-goal';

  @override
  State<AddBodyGoalPage> createState() => _AddBodyGoalPageState();
}

class _AddBodyGoalPageState extends State<AddBodyGoalPage> with MessagerMixin {
  late final AddBodyGoalCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<AddBodyGoalCubit>();
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
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Body Goal'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AppPrimaryButton(
          text: 'Create Body Goal',
          onPressed: _cubit.addBodyGoal,
        ),
        body: BlocConsumer<AddBodyGoalCubit, AddBodyGoalState>(
          listener: (context, state) async {
            if (state.status == AddBodyGoalStateStatus.loading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();

              if (state.status == AddBodyGoalStateStatus.failed) {
                showAppToast(
                    message: state.failure!.message, type: ToastType.error);
              } else if (state.status == AddBodyGoalStateStatus.success) {
                await getIt<AppRouter>().pop();
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
