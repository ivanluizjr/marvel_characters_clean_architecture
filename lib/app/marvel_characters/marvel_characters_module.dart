import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/core/constants/locales/routes/app_routes.dart';
import 'package:marvel_characters/app/marvel_characters/presenter/pages/home_page.dart';

class MarvelCharactersModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => const HomePage(),
        )
      ];
}
