
import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get localization{
    return AppLocalizations.of(this)!;

  }
}