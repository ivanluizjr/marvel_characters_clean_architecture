import 'package:either_dart/src/either.dart';
import 'package:marvel_characters/app/core/usecase/usecase_interface.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/failures/failures.dart';

import '../repositories/marvel_characters_repository.dart';

class GetMarvelCharactersUsecase
    extends IUsecase<MarvelCharactersEntity, NoParams> {
  final IMarvelCharactersRepository repository;

  GetMarvelCharactersUsecase({required this.repository});

  @override
  Future<Either<IFailures, MarvelCharactersEntity>> call(
      NoParams params) async {
    final result = await repository.getMarvelCharacters();

    return result;
  }
}
