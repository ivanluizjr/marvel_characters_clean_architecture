import 'package:marvel_characters/app/marvel_characters/data/mappers/marvel_characters_mapper.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';

abstract class IFailures {
  final String message;

  IFailures({required this.message});
}

class MarvelCharatersFailure extends IFailures {
  @override
  final String message;
  final StackTrace? stackTrace;

  MarvelCharatersFailure({
    required this.message,
    this.stackTrace,
  }) : super(message: '');
}

class MarvelCharactersSuccess extends IFailures {
  final MarvelCharactersMapper? mapper;
  final MarvelCharactersEntity? entity;

  MarvelCharactersSuccess({
    this.mapper,
    this.entity,
  }) : super(message: '');
}
