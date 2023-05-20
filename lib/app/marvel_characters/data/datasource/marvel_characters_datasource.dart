import 'package:marvel_characters/app/core/services/http_dio_client/http_response.dart';

abstract class IMarvelCharactersDatasource {
  Future<HttpDioResponse> getMarvelCharacters();
}
