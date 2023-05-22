import 'package:marvel_characters/app/modules/marvel_characters/domain/entities/marvel_characters_entity.dart';

abstract class IMarvelCharactersDatasource {
  Future<List<dynamic>> getMarvelCharacters({
    required MarvelCharactersEntity marvelCharactersEntity,
  });
}
