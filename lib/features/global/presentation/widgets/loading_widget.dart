import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gimme_goals/core/theme/theme.dart';

class LoadingWidget {
  static void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorColor = AppColors.primaryColor
      ..radius = 24
      ..progressColor = AppColors.primaryColor
      ..userInteractions = false
      ..indicatorWidget = const CupertinoActivityIndicator(
        color: AppColors.primaryColor,
        animating: true,
      )
      ..loadingStyle = EasyLoadingStyle.custom
      ..textColor = Colors.white
      ..backgroundColor = Colors.transparent
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.black.withOpacity(0.5)
      ..contentPadding = const EdgeInsets.all(30)
      ..dismissOnTap = false;
  }
}
