import 'package:either_dart/src/either.dart';
import 'package:marvel_characters/app/marvel_characters/data/datasource/marvel_characters_datasource.dart';
import 'package:marvel_characters/app/marvel_characters/data/mappers/marvel_characters_mapper.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';
import 'package:marvel_characters/app/marvel_characters/domain/repositories/marvel_characters_repository.dart';

class MarvelCharactersRepositoryImpl implements IMarvelCharactersRepository {
  final IMarvelCharactersDatasource datasource;

  MarvelCharactersRepositoryImpl({required this.datasource});

  @override
  Future<Either<IFailures, MarvelCharactersEntity>>
      getMarvelCharacters() async {
    try {
      final result = await datasource.getMarvelCharacters();

      final marvelEntity = MarvelCharactersMapper.fromMap(result);

      return Right(marvelEntity);
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
