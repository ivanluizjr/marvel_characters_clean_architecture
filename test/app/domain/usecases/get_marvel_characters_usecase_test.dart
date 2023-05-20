import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_characters/app/core/usecase/usecase_interface.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';
import 'package:marvel_characters/app/marvel_characters/domain/repositories/marvel_characters_repository.dart';
import 'package:marvel_characters/app/marvel_characters/domain/usecases/get_marvel_characters_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockMarvelCharactersRepository extends Mock
    implements IMarvelCharactersRepository {}

void main() {
  GetMarvelCharactersUsecase usecase;
  IMarvelCharactersRepository repository;

  setUp(() {
    repository = MockMarvelCharactersRepository();
    usecase = GetMarvelCharactersUsecase(repository: repository);
  });

  final noParams = NoParams();

  final thumbnail = MarvelCharacterThumbnail(
    path:
        'https://geekpersonalizado.com.br/wp-content/uploads/2021/06/Homem-de-ferro-foto.jpg',
    extension: 'jpg',
  );

  final returnData = MarvelCharactersEntity(
    id: 1,
    name: 'Homem de Ferro',
    description: 'O maior dos vingadores',
    thumbnail: thumbnail,
  );

  test('test to return the entity when the repository is called', () async {
    repository = MockMarvelCharactersRepository();

    when(() => repository.getMarvelCharacters()).thenAnswer(
      (_) async => Right(returnData),
    );

    usecase = GetMarvelCharactersUsecase(repository: repository);

    final result = await usecase(noParams);

    expect(
      result,
      Right<IFailures, MarvelCharactersEntity>(returnData),
    );

    verify(() => repository.getMarvelCharacters()).called(1);
  });
}
