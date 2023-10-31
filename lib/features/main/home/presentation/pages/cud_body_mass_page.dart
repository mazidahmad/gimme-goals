import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/data/models/model_provider.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_value_changer.dart';
import 'package:gimme_goals/features/main/home/presentation/cubit/cud_body_mass_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';

@RoutePage()
class CUDBodyMassPage extends StatefulWidget {
  const CUDBodyMassPage({this.bodyMass, super.key});

  static const String routeName = '/add-body-mass';
  final BodyMassModel? bodyMass;

  @override
  State<CUDBodyMassPage> createState() => _CUDBodyMassPageState();
}

class _CUDBodyMassPageState extends State<CUDBodyMassPage> with MessagerMixin {
  late final CUDBodyMassCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<CUDBodyMassCubit>();
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
      create: (context) => _cubit..initialize(widget.bodyMass),
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('${(widget.bodyMass == null) ? "Add" : "Edit"} Body Mass'),
          actions: [
            if (widget.bodyMass != null)
              IconButton(
                onPressed: () {
                  _cubit.deleteBodyMass(widget.bodyMass!);
                },
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.red,
                ),
              )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AppPrimaryButton(
          text: '${(widget.bodyMass == null) ? "Add Today" : "Edit"} Body Mass',
          onPressed: () {
            (widget.bodyMass != null)
                ? _cubit.updateBodyMass(widget.bodyMass!)
                : _cubit.addBodyMass();
          },
        ),
        body: BlocConsumer<CUDBodyMassCubit, CUDBodyMassState>(
          listener: (context, state) async {
            if (state.status == CUDBodyMassStateStatus.loading) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();

              if (state.status == CUDBodyMassStateStatus.failed) {
                showAppToast(
                    message: state.failure!.message, type: ToastType.error);
              } else if (state.status == CUDBodyMassStateStatus.success) {
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
