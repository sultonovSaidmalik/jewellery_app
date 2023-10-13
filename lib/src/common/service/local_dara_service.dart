import 'package:hive_flutter/hive_flutter.dart';

class LocalDataService {
  static final Box _box = Hive.box("mainApp");

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>("mainApp");
  }

  static Future<void> save<T>(BoxKeys key, T data) async {
    await _box.put(key.name, data);
  }

  static T? getData<T>(BoxKeys key, dynamic defaultValue) {
     return _box.get(key.name, defaultValue: defaultValue) as T?;
  }

  static Future<void> delete(BoxKeys key) async{
    await _box.delete(key.name);
  }
}

enum BoxKeys {
  card,
  favourites,
  auth,
}
