import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/core/constants/locales/routes/app_routes.dart';
import 'package:marvel_characters/app/core/services/config/environment.dart';
import 'package:marvel_characters/app/core/services/http_dio_client/dio/http_dio_client_service_impl.dart';
import 'package:marvel_characters/app/core/services/service_locator.dart';
import 'package:marvel_characters/app/modules/marvel_characters/data/datasource/impl/marvel_characters_datasource_impl.dart';
import 'package:marvel_characters/app/modules/marvel_characters/data/repositories/marvel_characters_repository_impl.dart';
import 'package:marvel_characters/app/modules/marvel_characters/domain/usecases/get_marvel_characters_usecase.dart';
import 'package:marvel_characters/app/modules/marvel_characters/presenter/cubit/home_cubit.dart';
import 'package:marvel_characters/app/modules/marvel_characters/presenter/pages/home_page.dart';

class MarvelCharactersModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => Dio(
            BaseOptions(
              baseUrl: Environment().config.apiHost,
            ),
          ),
        ),
        Bind.singleton(
          (i) => HttpDioClientServiceImpl(
            dio: i.get(),
          ),
        ),
        Bind.factory(
          (i) => HomeCubit(
            getMarvelCharactersUsecase: i.get(),
          ),
        ),
        Bind.factory(
          (i) => GetMarvelCharactersUsecaseImpl(
            repository: i.get(),
          ),
        ),
        Bind.factory(
          (i) => MarvelCharactersRepositoryImpl(
            datasource: i.get(),
          ),
        ),
        Bind.factory(
          (i) => MarvelCharactersDatasourceImpl(
            service: i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initialRoute,
          child: (context, args) => HomePage(
            cubit: ServiceLocatorService.dependency<HomeCubit>(),
          ),
        )
      ];
}
