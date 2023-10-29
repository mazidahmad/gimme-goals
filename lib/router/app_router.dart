import 'package:auto_route/auto_route.dart';
import 'package:gimme_goals/features/login/presentation/login_page.dart';
import 'package:gimme_goals/features/main/main_page.dart';
import 'package:gimme_goals/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:gimme_goals/features/register/presentation/pages/register_page.dart';
import 'package:gimme_goals/features/startup/presentation/pages/startup_page.dart';
import 'package:gimme_goals/features/verification_code/presentation/pages/verification_code_page.dart';
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
        )
      ];
}
