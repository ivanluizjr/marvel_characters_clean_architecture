import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/app/marvel_characters/domain/entities/marvel_characters_entity.dart';
import 'package:marvel_characters/app/marvel_characters/domain/usecases/get_marvel_characters_usecase.dart';
import 'package:marvel_characters/app/marvel_characters/presenter/cubit/states/home_states.dart';

class HomeCubit extends Cubit<IHomeStates> {
  final IGetMarvelCharactersUsecase getMarvelCharactersUsecase;

  HomeCubit({
    required this.getMarvelCharactersUsecase,
  }) : super(HomeInitialState());

  MarvelCharactersEntity marvelCharactersEntity =
      MarvelCharactersEntity.empty();

  String? imageLoadPath;

  Future<void> getMarvelCharacters() async {
    emit(HomeLoadingState());

    final result = await getMarvelCharactersUsecase(
        marvelCharactersEntity: marvelCharactersEntity);

    result.fold(
      (error) {
        emit(
          HomeErrorState(
            message: error.message,
          ),
        );
      },
      (success) {
        emit(
          HomeSuccessState(
            list: success,
            ids: success.map((character) => character.id).toList(),
            names: success.map((character) => character.name).toList(),
            descriptions:
                success.map((character) => character.description).toList(),
            thumbnails:
                success.map((character) => character.thumbnail).toList(),
            
          ),
        );

       
      },
    );
  }
}
