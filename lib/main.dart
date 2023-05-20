import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app_module.dart';
import 'package:marvel_characters/app_widget.dart';

import 'app/core/services/config/environment.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ]);

      const String environment = String.fromEnvironment(
        'ENVIRONMENT',
        defaultValue: Environment.dev,
      );
      Environment().initiConfig(environment);

      runApp(
        ModularApp(
          module: AppModule(),
          child: const AppWidget(),
        ),
      );
    },
    (error, stack) {},
  );
}
