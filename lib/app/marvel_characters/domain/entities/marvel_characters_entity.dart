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

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'extension': extension,
    };
  }
}
