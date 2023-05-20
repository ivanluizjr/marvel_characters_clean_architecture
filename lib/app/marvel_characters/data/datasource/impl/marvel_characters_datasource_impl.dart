import 'package:marvel_characters/app/core/constants/locales/api/api_parameters.dart';
import 'package:marvel_characters/app/core/constants/locales/api/endpoints.dart';
import 'package:marvel_characters/app/core/services/http_dio_client/http_dio_client_service.dart';
import 'package:marvel_characters/app/core/services/http_dio_client/http_response.dart';
import 'package:marvel_characters/app/marvel_characters/data/datasource/marvel_characters_datasource.dart';

class MarvelCharactersDatasourceImpl implements IMarvelCharactersDatasource {
  final IHttpDioClientService service;

  MarvelCharactersDatasourceImpl({required this.service});

  @override
  Future<HttpDioResponse> getMarvelCharacters() async {
    final response = await service.get(
      Endpoints.charactersData(
        ts: ApiParameters.ts,
        apiKey: ApiParameters.publicKey,
        hash: ApiParameters.hash,
      ),
    );

    if (response.statusCode == 200) {
      final data = response.data;
      final results = data['data']['results'];

      return results;
    } else {
      throw Exception('Falha em buscar Marvel Characters');
    }
  }
}
