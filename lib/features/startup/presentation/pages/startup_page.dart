import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/features/global/presentation/widgets/app_logo_widget.dart';
import 'package:gimme_goals/features/startup/presentation/cubit/startup_cubit.dart';
import 'package:gimme_goals/router/app_router.dart';
import 'package:gimme_goals/router/app_router.gr.dart';

@RoutePage()
class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  static const String routeName = '/startup';

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  late final StartupCubit _cubit;

  @override
  void initState() {
    _cubit = getIt<StartupCubit>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit..initializeStartup(),
      child: BlocListener<StartupCubit, StartupState>(
        listener: (context, state) async {
          if (state is StartupNotLoggedIn) {
            await getIt<AppRouter>().replace(const OnBoardingRoute());
          } else if (state is StartupLoggedIn) {
            await getIt<AppRouter>().replace(const MainRoute());
          }
        },
        child: const Scaffold(
          body: SafeArea(
            child: Center(
              child: AppLogoWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
