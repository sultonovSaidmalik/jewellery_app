import 'dart:ui';

import 'package:flutter/foundation.dart';
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

  static Future<void> delete(BoxKeys key) async {
    await _box.delete(key.name);
  }

  // User

  static Future<void> setUser(String name, String phone) async {
    await _box.put("name", name);
    await _box.put("phone", phone);
    await _box.put("isUser", true);
  }

  static Future<void> clearUser() async {
    await _box.delete("name");
    await _box.delete("phone");
    await _box.delete("isUser");
  }

  static bool get isUser => _box.get("isUser", defaultValue: false) as bool;

  static ValueListenable<Box<dynamic>> get isUserListenable =>
      _box.listenable(keys: [
        "isUser",
        "name",
        "phone",
      ]);

  static (String name, String phone) getUser() {
    String name = _box.get("name", defaultValue: "");
    String phone = _box.get("phone", defaultValue: "");
    return (name, phone);
  }

  // Language Service

  static bool get isSaveLocale => _box.get("isLocale", defaultValue: false);

  static Future<void> setLocale(Locale locale) async {
    await _box.put("locale", locale.languageCode);
    await _box.put("isLocale", true);
  }
  static Future<void> clearLocale(String locale) async {
    await _box.delete("locale");
    await _box.delete("isLocale");
  }

  static Locale get getLocale => Locale(_box.get("locale", defaultValue: "uz"));
  static ValueListenable<Box<dynamic>> get localeListenable => _box.listenable(keys: ["locale"]);
}

enum BoxKeys {
  card,
  favourites,
  auth,
}
