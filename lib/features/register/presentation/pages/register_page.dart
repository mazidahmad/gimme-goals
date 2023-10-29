import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_logo_widget.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_text_form_field.dart';
import 'package:gimme_goals/features/register/presentation/cubit/register_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const String routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cubit = getIt<RegisterCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        body: BlocListener<RegisterCubit, RegisterState>(
          listener: (context, state) async {
            if (state is RegisterLoading) {
              await EasyLoading.show();
            } else {
              await EasyLoading.dismiss();
              if (state is RegisterSuccess) {
                await getIt<AppRouter>().replace(const VerificationCodeRoute());
              }
            }
          },
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppAssets.onboardingBackground,
                  ),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: AppColors.gradient1,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: AppColors.backgroundColor,
                      ),
                    )
                  ],
                ),
                SafeArea(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Spacer(
                            flex: 3,
                          ),
                          Gap(5.h),
                          const AppLogoWidget(),
                          Gap(37.h),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                AppTextFormField(
                                  hint: 'Email',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email required';
                                    }
                                    return null;
                                  },
                                  controller: _cubit.emailController,
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: AppColors.hintTextColor,
                                  ),
                                ),
                                Gap(20.h),
                                AppTextFormField(
                                  hint: 'Password',
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Password required';
                                    }
                                    return null;
                                  },
                                  isObscured: true,
                                  controller: _cubit.passwordController,
                                  prefixIcon: const Icon(
                                    Icons.lock_outlined,
                                    color: AppColors.hintTextColor,
                                  ),
                                ),
                                Gap(20.h),
                                AppTextFormField(
                                  hint: 'Confirm Password',
                                  validator: (value) {
                                    if (value !=
                                        _cubit.passwordController.text) {
                                      return "Password doesn't match";
                                    }
                                    return null;
                                  },
                                  controller:
                                      _cubit.passwordConfirmationController,
                                  isObscured: true,
                                  prefixIcon: const Icon(
                                    Icons.lock_outlined,
                                    color: AppColors.hintTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap(37.h),
                          AppPrimaryButton(
                            width: double.infinity,
                            text: 'Sign Up',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _cubit.registerAccount();
                              }
                            },
                          ),
                          Gap(42.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Already have account? ",
                                style: AppTextStyle.bodyLarge(),
                              ),
                              GestureDetector(
                                onTap: () {
                                  getIt<AppRouter>()
                                      .replace(const LoginRoute());
                                },
                                child: Text(
                                  "Sign In",
                                  style: AppTextStyle.headlineMedium(
                                      color: AppColors.primaryColor),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
