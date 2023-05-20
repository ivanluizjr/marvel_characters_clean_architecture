import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';

class MarvelCharactersMapper {
  final int id;
  final String name;
  final String description;
  final MarvelCharacterThumbnail thumbnail;

  MarvelCharactersMapper({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  static MarvelCharactersEntity fromMap(Map<String, dynamic> map) {
    final thumbnailData = map['thumbnail'];
    final thumbnail = MarvelCharacterThumbnail(
      path: thumbnailData['path'],
      extension: thumbnailData['extension'],
    );

    return MarvelCharactersEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnail: thumbnail,
    );
  }
}
