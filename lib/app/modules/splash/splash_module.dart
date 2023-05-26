import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/core/constants/locales/routes/app_routes.dart';
import 'package:marvel_characters/app/modules/splash/presenter/pages/splash_page_page.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => const SplashPagePage(),
        )
      ];
}
