import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/mixin/messenger_mixin.dart';
import 'package:gimme_goals/core/theme/theme.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_logo_widget.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_text_form_field.dart';
import 'package:gimme_goals/features/login/presentation/cubit/login_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessagerMixin {
  late final LoginCubit _cubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _cubit = getIt<LoginCubit>();
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
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();

            if (state is LoginSuccess) {
              getIt<AppRouter>().replace(const MainRoute());
            } else if (state is LoginConfirmSignUp) {
              getIt<AppRouter>().replace(
                  VerificationCodeRoute(email: _cubit.emailController.text));
            } else if (state is LoginFailed) {
              showAppToast(
                  message: state.failure.message, type: ToastType.error);
            }
          }
        },
        child: Scaffold(
          body: KeyboardVisibilityBuilder(
            builder: (_, isKeyboardVisible) {
              return Container(
                padding: EdgeInsets.only(bottom: isKeyboardVisible ? 300.h : 0),
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
                                      controller: _cubit.emailController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Email cannot be empty';
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(
                                        Icons.email_outlined,
                                        color: AppColors.hintTextColor,
                                      ),
                                    ),
                                    Gap(20.h),
                                    AppTextFormField(
                                      hint: 'Password',
                                      controller: _cubit.passwordController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password cannot be empty';
                                        }
                                        return null;
                                      },
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
                                text: 'Sign In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _cubit.loginAccount();
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
                                    "Didn't have any account? ",
                                    style: AppTextStyle.bodyLarge(),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      getIt<AppRouter>()
                                          .replace(const RegisterRoute());
                                    },
                                    child: Text(
                                      "Sign Up",
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
              );
            },
          ),
        ),
      ),
    );
  }
}
