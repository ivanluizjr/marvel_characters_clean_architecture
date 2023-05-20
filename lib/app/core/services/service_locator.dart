import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ServiceLocatorService {
  static T dependency<T extends Object>() {
    return Modular.get<T>();
  }

  static void addListener(VoidCallback listerner) {
    Modular.to.addListener(listerner);
  }

  static void removeListerner(VoidCallback listerner) {
    Modular.to.removeListener(listerner);
  }

  static final String currentPath = Modular.to.path;
}
