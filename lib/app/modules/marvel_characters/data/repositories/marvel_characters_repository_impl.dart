import 'package:either_dart/src/either.dart';
import 'package:marvel_characters/app/core/services/http_dio_client/http_dio_failure.dart';
import 'package:marvel_characters/app/modules/marvel_characters/data/datasource/marvel_characters_datasource.dart';
import 'package:marvel_characters/app/modules/marvel_characters/data/mappers/marvel_characters_mapper.dart';
import 'package:marvel_characters/app/modules/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/modules/marvel_characters/domain/failures/failures.dart';
import 'package:marvel_characters/app/modules/marvel_characters/domain/repositories/marvel_characters_repository.dart';

class MarvelCharactersRepositoryImpl implements IMarvelCharactersRepository {
  final IMarvelCharactersDatasource datasource;

  MarvelCharactersRepositoryImpl({required this.datasource});

  @override
  Future<Either<IFailures, List<MarvelCharactersEntity>>> getMarvelCharacters(
      {required MarvelCharactersEntity marvelCharactersEntity}) async {
    try {
      final List<dynamic> result = await datasource.getMarvelCharacters(
          marvelCharactersEntity: marvelCharactersEntity);

      final marvelEntity = MarvelCharactersMapper.fromList(result);

      return Right(marvelEntity);
    } on HttpDioFailure catch (error) {
      return Left(
        MarvelCharatersFailure(
          message: error.message,
        ),
      );
    } catch (error) {
      return Left(
        MarvelCharatersFailure(
          message: 'An unexpected error occurred.',
        ),
      );
    }
  }
}
