import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/app_colors.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_avatar.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_primary_button.dart';
import 'package:gimme_goals/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const String routeName = '/profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfileCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<ProfileCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileLoggedOut) {
              getIt<AppRouter>().replaceAll([const OnBoardingRoute()]);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Gap(40.h),
                    const AppAvatar(size: 40),
                    Gap(40.h),
                    AppPrimaryButton(
                      color: AppColors.red,
                      textColor: AppColors.textColor,
                      text: 'Log Out',
                      onPressed: () {
                        _cubit.logout();
                      },
                    )
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
