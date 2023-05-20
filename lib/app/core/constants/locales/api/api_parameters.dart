import 'dart:convert';

import 'package:crypto/crypto.dart' as crypto;

class ApiParameters {
  static const String publicKey = 'f651ed836d5536b6dda0df6c729f1ce7';
  static const String privateKey = '99b49e0a53b91b40c2ebac3aa04fe0435eb733fb';
  static String ts = DateTime.now().millisecondsSinceEpoch.toString();
  static String keyHash = ts + privateKey + publicKey;
  static String hash =
      crypto.md5.convert(const Utf8Encoder().convert(keyHash)).bytes.toString();
}
