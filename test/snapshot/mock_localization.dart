import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

class MockDelegate extends LocalizationsDelegate {
  @override
  bool isSupported(Locale locale) {
    return locale.supportedLanguagesCodes.contains(locale.languageCode);
  }

  @override
  Future<AppTranslations> load(Locale locale) async {
    final appTranslations = AppTranslations(locale);
    final jsonPath = "assets/locale/label_${locale.languageCode}.json";

    String jsonContent = File("../$jsonPath").existsSync()
        ? File("../$jsonPath").readAsStringSync()
        : File(jsonPath).readAsStringSync();

    AppTranslations.newLocalisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}
