import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/verification/presentation/cubit/verification_code_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({required this.email, super.key});

  static const String routeName = '/verification-code';

  final String email;

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  late final VerificationCodeCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<VerificationCodeCubit>();
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
      child: BlocListener<VerificationCodeCubit, VerificationCodeState>(
        listener: (context, state) async {
          if (state is VerificationCodeLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
            if (state is VerificationCodeSuccess) {
              await getIt<AppRouter>().replace(const MainRoute());
            }
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Verification'),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Enter verification code',
                    style: AppTextStyle.headlineLarge(),
                  ),
                  Gap(30.h),
                  Pinput(
                    length: 6,
                    onCompleted: (code) {
                      _cubit.verifyAccount(widget.email, code);
                    },
                    textCapitalization: TextCapitalization.characters,
                    defaultPinTheme: PinTheme(
                      decoration: BoxDecoration(
                          color: AppColors.textfieldBackgroundColor
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.sp)),
                      padding: EdgeInsets.all(10.sp),
                      textStyle: AppTextStyle.displaySmall(),
                      height: 50.h,
                      width: 50.w,
                    ),
                  ),
                  Gap(30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
