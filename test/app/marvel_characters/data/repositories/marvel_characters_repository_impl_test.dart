import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_characters/app/core/services/http_dio_client/http_dio_failure.dart';
import 'package:marvel_characters/app/marvel_characters/data/datasource/marvel_characters_datasource.dart';
import 'package:marvel_characters/app/marvel_characters/data/repositories/marvel_characters_repository_impl.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';
import 'package:mocktail/mocktail.dart';

class MarvelCharactersDatasourceMock extends Mock
    implements IMarvelCharactersDatasource {}

void main() {
  group('MarvelCharactersRepositoryImpl', () {
    late MarvelCharactersRepositoryImpl repository;
    late MarvelCharactersDatasourceMock datasource;

    setUp(() {
      datasource = MarvelCharactersDatasourceMock();
      repository = MarvelCharactersRepositoryImpl(datasource: datasource);
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

      registerFallbackValue(marvelCharactersEntity);

      when(() => datasource.getMarvelCharacters(
            marvelCharactersEntity: any(named: 'marvelCharactersEntity'),
          )).thenAnswer((_) async => [marvelCharactersEntity]);

      final result = await repository.getMarvelCharacters(
        marvelCharactersEntity: marvelCharactersEntity,
      );

      expect(
        result.fold(
          (failure) => false,
          (characters) => characters.isNotEmpty,
        ),
        true,
      );
    });

    test('should return a failure when an HttpDioFailure occurs', () async {
      final marvelCharactersEntity = MarvelCharactersEntity(
        id: 1011334,
        name: 'Spider-Man',
        description: 'Friendly neighborhood superhero.',
        thumbnail: MarvelCharacterThumbnail(
          path: 'https://example.com/images/spiderman',
          extension: 'jpg',
        ),
      );

      registerFallbackValue(marvelCharactersEntity);

      when(() => datasource.getMarvelCharacters(
            marvelCharactersEntity: any(named: 'marvelCharactersEntity'),
          )).thenThrow(const HttpDioFailure(statusCode: 400));

      final result = await repository.getMarvelCharacters(
        marvelCharactersEntity: marvelCharactersEntity,
      );

      expect(
        result.fold(
          (failure) => failure is MarvelCharatersFailure,
          (characters) => false,
        ),
        true,
      );
    });

    test('should return a failure when an unexpected error occurs', () async {
      final marvelCharactersEntity = MarvelCharactersEntity(
        id: 1011334,
        name: 'Spider-Man',
        description: 'Friendly neighborhood superhero.',
        thumbnail: MarvelCharacterThumbnail(
          path: 'https://example.com/images/spiderman',
          extension: 'jpg',
        ),
      );

      registerFallbackValue(marvelCharactersEntity);

      when(() => datasource.getMarvelCharacters(
            marvelCharactersEntity: any(named: 'marvelCharactersEntity'),
          )).thenThrow(Exception('Unexpected error'));

      final result = await repository.getMarvelCharacters(
        marvelCharactersEntity: marvelCharactersEntity,
      );

      expect(
        result.fold(
          (failure) => failure is MarvelCharatersFailure,
          (characters) => false,
        ),
        true,
      );
    });
  });
}
