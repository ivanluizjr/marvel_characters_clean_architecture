import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';
import 'package:marvel_characters/app/marvel_characters/domain/repositories/marvel_characters_repository.dart';
import 'package:marvel_characters/app/marvel_characters/domain/usecases/get_marvel_characters_usecase.dart';

class MarvelCharactersRepositoryMock implements IMarvelCharactersRepository {
  @override
  Future<Either<IFailures, List<MarvelCharactersEntity>>> getMarvelCharacters({
    required MarvelCharactersEntity marvelCharactersEntity,
  }) async {
    return Right([
      MarvelCharactersEntity(
        id: 1011334,
        name: 'Spider-Man',
        description: 'Friendly neighborhood superhero.',
        thumbnail: MarvelCharacterThumbnail(
          path: 'https://example.com/images/spiderman',
          extension: 'jpg',
        ),
      )
    ]);
  }
}

void main() {
  group('GetMarvelCharactersUsecaseImpl', () {
    late GetMarvelCharactersUsecaseImpl usecase;
    late MarvelCharactersRepositoryMock repository;

    setUp(() {
      repository = MarvelCharactersRepositoryMock();
      usecase = GetMarvelCharactersUsecaseImpl(repository: repository);
    });

    test('should return a non-null list of MarvelCharactersEntity', () async {
      final marvelCharactersEntity = MarvelCharactersEntity(
        id: 1011334,
        name: 'Spider-Man',
        description: 'Friendly neighborhood superhero.',
        thumbnail: MarvelCharacterThumbnail(
          path: 'https://example.com/images/spiderman',
          extension: 'jpg',
        ),
      );

      final result =
          await usecase.call(marvelCharactersEntity: marvelCharactersEntity);

      result.fold(
        (failure) => fail('Expected Right, but got Left($failure)'),
        (characters) {
          expect(characters, isA<List<MarvelCharactersEntity>>());
          expect(characters, isNotEmpty);
        },
      );
    });
  });
}
