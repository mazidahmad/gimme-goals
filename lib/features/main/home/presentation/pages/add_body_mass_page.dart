import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_value_changer.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/add_body_mass_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';

@RoutePage()
class AddBodyMassPage extends StatefulWidget {
  const AddBodyMassPage({super.key});

  static const String routeName = '/add-body-mass';

  @override
  State<AddBodyMassPage> createState() => _AddBodyMassPageState();
}

class _AddBodyMassPageState extends State<AddBodyMassPage> with MessagerMixin {
  late final AddBodyMassCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<AddBodyMassCubit>();
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
          title: const Text('Add Body Mass'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: AppPrimaryButton(
          text: 'Add Today Body Mass',
          onPressed: _cubit.addBodyMass,
        ),
        body: BlocConsumer<AddBodyMassCubit, AddBodyMassState>(
          listener: (context, state) async {
            if (state.status == AddBodyMassStateStatus.loading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();

              if (state.status == AddBodyMassStateStatus.failed) {
                showAppToast(
                    message: state.failure!.message, type: ToastType.error);
              } else if (state.status == AddBodyMassStateStatus.success) {
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
