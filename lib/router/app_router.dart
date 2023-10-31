import 'package:auto_route/auto_route.dart';
import 'package:gimme_goals/features/login/presentation/pages/login_page.dart';
import 'package:gimme_goals/features/main/home/presentation/pages/cu_body_goal_page.dart';
import 'package:gimme_goals/features/main/home/presentation/pages/cud_body_mass_page.dart';
import 'package:gimme_goals/features/main/main_page.dart';
import 'package:gimme_goals/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:gimme_goals/features/profile/presentation/pages/profile_page.dart';
import 'package:gimme_goals/features/register/presentation/pages/register_page.dart';
import 'package:gimme_goals/features/startup/presentation/pages/startup_page.dart';
import 'package:gimme_goals/features/verification/presentation/pages/verification_code_page.dart';
import 'package:gimme_goals/router/app_router.gr.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: StartupRoute.page,
          path: StartupPage.routeName,
          initial: true,
        ),
        CustomRoute(
            page: OnBoardingRoute.page,
            path: OnBoardingPage.routeName,
            transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
            page: LoginRoute.page,
            path: LoginPage.routeName,
            transitionsBuilder: TransitionsBuilders.noTransition),
        CustomRoute(
            page: RegisterRoute.page,
            path: RegisterPage.routeName,
            transitionsBuilder: TransitionsBuilders.noTransition),
        AutoRoute(
          page: VerificationCodeRoute.page,
          path: VerificationCodePage.routeName,
        ),
        AutoRoute(
          page: MainRoute.page,
          path: MainPage.routeName,
        ),
        AutoRoute(
          page: ProfileRoute.page,
          path: ProfilePage.routeName,
        ),
        AutoRoute(
          page: CUDBodyMassRoute.page,
          path: CUDBodyMassPage.routeName,
        ),
        AutoRoute(
          page: CUBodyGoalRoute.page,
          path: CUBodyGoalPage.routeName,
        )
      ];
}
