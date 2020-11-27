import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:mini_project/models/models.dart';

class Globals {
  static final String defaultLanguage = Platform.localeName.split('_')[0];

//List of languages that are supported.  Used in selector.
//Follow this plugin for translating a google sheet to languages
//https://github.com/aloisdeniel/flutter_sheet_localization
//Flutter App translations google sheet
//https://docs.google.com/spreadsheets/d/1oS7iJ6ocrZBA53SxRfKF0CG9HAaXeKtzvsTBhgG4Zzk/edit?usp=sharing

  static List<MenuOptionsModel> languageOptions(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return [
      MenuOptionsModel(key: "th", value: "${labels?.setting?.languagesthlabel}"),
      MenuOptionsModel(key: "en", value: "${labels?.setting?.languagesenglabel}"),
    ];
  }
}
