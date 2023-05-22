import '../../../domain/entities/marvel_characters_entity.dart';

abstract class IHomeStates {}

class HomeInitialState extends IHomeStates {}

class HomeLoadingState extends IHomeStates {}

class HomeErrorState extends IHomeStates {
  final String message;

  HomeErrorState({
    required this.message,
  });
}

class HomeSuccessState extends IHomeStates {
  final List<MarvelCharactersEntity> list;
  final List<int> ids;
  final List<String> names;
  final List<String> descriptions;
  final List<MarvelCharacterThumbnail> thumbnails;

  HomeSuccessState({
    required this.descriptions,
    required this.thumbnails,
    required this.names,
    required this.ids,
    required this.list,
  });
}
