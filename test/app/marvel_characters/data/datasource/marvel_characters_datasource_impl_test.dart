import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_characters/app/core/services/http_dio_client/http_dio_client_service.dart';
import 'package:marvel_characters/app/core/services/http_dio_client/http_response.dart';
import 'package:marvel_characters/app/marvel_characters/data/datasource/impl/marvel_characters_datasource_impl.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:mocktail/mocktail.dart';

class HttpDioClientServiceMock extends Mock implements IHttpDioClientService {}

void main() {
  group('MarvelCharactersDatasourceImpl', () {
    late MarvelCharactersDatasourceImpl datasource;
    late HttpDioClientServiceMock service;

    setUp(() {
      service = HttpDioClientServiceMock();
      datasource = MarvelCharactersDatasourceImpl(service: service);
    });

    test('should return a list of characters when the response is successful',
        () async {
      final marvelCharactersEntity = MarvelCharactersEntity(
        id: 1011334,
        name: 'Spider-Man',
        description: 'Friendly neighborhood superhero.',
        thumbnail: MarvelCharacterThumbnail(
          path: 'https://example.com/images/spiderman',
          extension: 'jpg',
        ),
      );

      // Simulate a successful response
      const successfulResponse = HttpDioResponse<Map<String, dynamic>>({
        'data': {
          'results': [
            {
              'id': 1011334,
              'name': 'Spider-Man',
              'description': 'Friendly neighborhood superhero.',
              'thumbnail': {
                'path': 'https://example.com/images/spiderman',
                'extension': 'jpg',
              },
            },
            // More characters...
          ],
        },
      }, statusCode: 200);

      when(() => service.get(any()))
          .thenAnswer((_) async => successfulResponse);

      final result = await datasource.getMarvelCharacters(
        marvelCharactersEntity: marvelCharactersEntity,
      );

      // Assert that the result is a non-empty list
      expect(result, isA<List<dynamic>>());
      expect(result.isNotEmpty, isTrue);
    });

    test('should throw an exception when the response is not successful',
        () async {
      final marvelCharactersEntity = MarvelCharactersEntity(
        id: 1011334,
        name: 'Spider-Man',
        description: 'Friendly neighborhood superhero.',
        thumbnail: MarvelCharacterThumbnail(
          path: 'https://example.com/images/spiderman',
          extension: 'jpg',
        ),
      );

      // Simulate an unsuccessful response
      const unsuccessfulResponse = HttpDioResponse<Map<String, dynamic>>(
        {
          'data': {null},
        },
        statusCode: 500,
      );

      when(() => service.get(any()))
          .thenAnswer((_) async => unsuccessfulResponse);

      // Assert that an exception is thrown
      expect(
        () => datasource.getMarvelCharacters(
          marvelCharactersEntity: marvelCharactersEntity,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
