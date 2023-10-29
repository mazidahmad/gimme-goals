import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gimme_goals/app.dart';
import 'package:gimme_goals/core/di/service_locator.dart';

Future<void> main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        configureDependencies();

        return runApp(const MyApp());
      },
      (error, stack) {
        log(error.toString(), stackTrace: stack);
      },
    );
