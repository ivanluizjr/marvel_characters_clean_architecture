import 'package:marvel_characters/app/core/services/dio_client/dio_client_service.dart';
import 'package:marvel_characters/app/marvel_characters/data/datasource/marvel_characters_datasource.dart';

class MarvelCharactersDatasourceImpl implements IMarvelCharactersDatasource {
  final IDioClientService service;

  MarvelCharactersDatasourceImpl({required this.service});

  @override
  Future<Map<String, dynamic>> getMarvelCharacters() async {
    final response = await service.get('');

    return response.data;
  }
}
