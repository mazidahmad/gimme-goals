import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  static const String routeName = '/verification-code';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onCompleted: (_) {
                getIt<AppRouter>().replace(const MainRoute());
              },
              textCapitalization: TextCapitalization.characters,
              defaultPinTheme: PinTheme(
                decoration: BoxDecoration(
                    color: AppColors.textfieldBackgroundColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.sp)),
                padding: EdgeInsets.all(20.sp),
                textStyle: AppTextStyle.displayMedium(),
                height: 60.h,
                width: 60.w,
              ),
            ),
            Gap(30.h),
          ],
        ),
      )),
    );
  }
}
