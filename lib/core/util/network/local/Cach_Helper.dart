import 'package:booking/core/util/mangerLang/manger_languge.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;

  static init() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();

    }

  }

  Future<String?> getAppLanguage() async {
    String? language = sharedPreferences?.getString('lang');
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.English.getValue();
    }
  }

  Future<void> changeLanguage() async {
    String? currentLang = await getAppLanguage();
    if (currentLang == LanguageType.English.getValue()) {
      sharedPreferences!.setString('lang', LanguageType.English.getValue());
    } else {
      if (currentLang == LanguageType.Arabic.getValue()) {
        sharedPreferences!.setString('lang', LanguageType.Arabic.getValue());
      }    }
  }

  Future<Locale> getLocal() async {
    String? currentLang = await getAppLanguage();
    if (currentLang == LanguageType.English.getValue()) {
      return English_local;
    } else {
      return Arabic_local;
    }
  }
  Future<Locale> setLocal() async {
    String? currentLang = await getAppLanguage();
    if (currentLang == LanguageType.Arabic.getValue()) {
      return Arabic_local;
    } else {
      return English_local;
    }
  }

  static Future<dynamic> putData({
    required dynamic key,
    required dynamic value,
  }) async {
    return await sharedPreferences?.setString(key, value);
  }

  static dynamic getData({
    required String key,
  }) {
    return sharedPreferences?.get(key);
  }

  static Future<dynamic> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    return await sharedPreferences!.setString(key, value);
  }
}

