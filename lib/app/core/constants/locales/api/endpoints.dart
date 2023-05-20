class Endpoints {
  static charactersData({
    required String ts,
    required String apiKey,
    required String hash,
  }) =>
      '/characters?ts=$ts&apikey=$apiKey&hash=$hash';
}
