import 'package:either_dart/either.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';

abstract class IMarvelCharactersRepository {
  Future<Either<IFailures, MarvelCharactersEntity>> getMarvelCharacters();
}
