
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationUtil on BuildContext{
  AppLocalizations get setLanguage{
    return AppLocalizations.of(this)!;
  }
}