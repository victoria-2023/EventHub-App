import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalizationService {
  final Locale locale;
  Map<String, String> _localizedStrings;

  LocalizationService(this.locale, this._localizedStrings);

  static Future<LocalizationService> load(Locale locale) async {
    String jsonString = await rootBundle.loadString('assets/locales/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    Map<String, String> localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return LocalizationService(locale, localizedStrings);
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static of(BuildContext context) {}
}
