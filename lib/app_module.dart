import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/core/constants/locales/routes/app_routes.dart';
import 'package:marvel_characters/app/modules/marvel_characters/marvel_characters_module.dart';
import 'package:marvel_characters/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.initialRoute,
          module: SplashModule(),
        ),
        ModuleRoute(
          AppRoutes.homePageRoute,
          module: MarvelCharactersModule(),
        ),
      ];
}
