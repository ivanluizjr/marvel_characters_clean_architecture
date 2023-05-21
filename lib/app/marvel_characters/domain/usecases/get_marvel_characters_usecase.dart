import 'package:either_dart/src/either.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';
import 'package:marvel_characters/app/marvel_characters/domain/repositories/marvel_characters_repository.dart';

abstract class IGetMarvelCharactersUsecase {
  Future<Either<IFailures, List<MarvelCharactersEntity>>> call({
    required MarvelCharactersEntity marvelCharactersEntity,
  });
}

class GetMarvelCharactersUsecaseImpl extends IGetMarvelCharactersUsecase {
  final IMarvelCharactersRepository repository;

  GetMarvelCharactersUsecaseImpl({required this.repository});

  @override
  Future<Either<IFailures, List<MarvelCharactersEntity>>> call({
    required MarvelCharactersEntity marvelCharactersEntity,
  }) async {
    final response = await repository.getMarvelCharacters(
      marvelCharactersEntity: marvelCharactersEntity,
    );

    return response;
  }
}
