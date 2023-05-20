import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_characters/app/marvel_characters/data/datasource/marvel_characters_datasource.dart';
import 'package:marvel_characters/app/marvel_characters/data/repositories/marvel_characters_repository_impl.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockMarvelCharactersDatasource extends Mock
    implements IMarvelCharactersDatasource {}

class MockMarvelCharactersEntity extends Mock
    implements MarvelCharactersEntity {}

void main() {
  late MarvelCharactersRepositoryImpl repository;
  late IMarvelCharactersDatasource datasource;

  setUp(() {
    datasource = MockMarvelCharactersDatasource();
    repository = MarvelCharactersRepositoryImpl(datasource: datasource);
  });

  test('getMarvelCharacters should return MarvelCharactersEntity on success',
      () async {
    final thumbnail = MarvelCharacterThumbnail(
      path:
          'https://geekpersonalizado.com.br/wp-content/uploads/2021/06/Homem-de-ferro-foto.jpg',
      extension: 'jpg',
    );

    final expectedData = {
      'algo': [
        MarvelCharactersEntity(
          id: 1,
          name: 'Homem de Ferro',
          description: 'O maior dos vingadores',
          thumbnail: thumbnail,
        ),
      ]
    };

    when(() => datasource.getMarvelCharacters());

    final result = await repository.getMarvelCharacters();

    expect(
      result.fold(
        (failure) => null,
        (entity) => entity,
      ),
      isA<MarvelCharactersEntity>(),
    );
  });

  test('getMarvelCharacters should throw an exception on failure', () async {
    final exception = Exception('Error getting Marvel characters');

    when(() => datasource.getMarvelCharacters()).thenThrow(exception);

    expect(
      () async => await repository.getMarvelCharacters(),
      throwsA(exception.toString()),
    );
  });
}
