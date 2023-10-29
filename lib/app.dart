import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gimme_goals/core/di/service_locator.dart';
import 'package:gimme_goals/core/theme/app_theme.dart';
import 'package:gimme_goals/core/theme/screen_size.dart';
import 'package:gimme_goals/router/app_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    var windowData = MediaQueryData.fromView(WidgetsBinding.instance.window);
    return ScreenUtilInit(
      designSize: Size(
        ScreenSize.width,
        ScreenSize.height,
      ),
      builder: (context, child) => MediaQuery(
        data: windowData.copyWith(textScaleFactor: 1),
        child: MaterialApp.router(
          title: 'My Todo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.main(),
          themeMode: ThemeMode.dark,
          darkTheme: AppTheme.main(),
          routerConfig: _appRouter.config(),
        ),
      ),
    );
  }
}
