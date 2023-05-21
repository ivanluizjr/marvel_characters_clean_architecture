import 'package:equatable/equatable.dart';

class MarvelCharactersEntity extends Equatable {
  final int id;
  final String name;
  final String description;
  final MarvelCharacterThumbnail thumbnail;

  const MarvelCharactersEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });

  factory MarvelCharactersEntity.empty() {
    return MarvelCharactersEntity(
      id: 1011334,
      name: '',
      description: '',
      thumbnail: MarvelCharacterThumbnail(
        extension: '',
        path: '',
      ),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        thumbnail,
      ];

  
}

class MarvelCharacterThumbnail {
  final String path;
  final String extension;

  MarvelCharacterThumbnail({
    required this.path,
    required this.extension,
  });

  static MarvelCharacterThumbnail fromMap(Map<String, dynamic> map) {
    final path = map['path'];
    final extension = map['extension'];

    final imageUrl = '$path.$extension';

    return MarvelCharacterThumbnail(
      path: imageUrl,
      extension: extension,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'extension': extension,
    };
  }
}
