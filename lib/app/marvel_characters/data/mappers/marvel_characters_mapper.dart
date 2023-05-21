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

  static List<MarvelCharactersEntity> fromList(List<dynamic> list) {
    return list.map((item) => fromMap(item as Map<String, dynamic>)).toList();
  }

  static MarvelCharactersEntity fromMap(Map<String, dynamic> map) {
    final thumbnailData = map['thumbnail'];
    final path = thumbnailData['path'];
    final extension = thumbnailData['extension'];

    final thumbnail = MarvelCharacterThumbnail(
      path: path != null ? '$path.$extension' : '',
      extension: extension,
    );

    return MarvelCharactersEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      thumbnail: thumbnail,
    );
  }
}
