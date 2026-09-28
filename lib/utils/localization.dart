import 'package:anymex/l10n/generated/app_localizations.dart';
import 'package:anymex/utils/app_localization_lookup.dart';
import 'package:flutter/widgets.dart';

extension AppLocalizationsBuildContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

Locale resolveAppLocale(Locale? deviceLocale) =>
    deviceLocale?.languageCode == 'zh'
        ? const Locale('zh', 'CN')
        : const Locale('en', 'US');

String localizeAppText(BuildContext context, String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return value;

  final localized = lookupLocalizedText(context.l10n, trimmed) ?? trimmed;
  final leadingWhitespace = value.length - value.trimLeft().length;
  final trailingWhitespace = value.length - value.trimRight().length;
  final leading = value.substring(0, leadingWhitespace);
  final trailing = trailingWhitespace == 0
      ? ''
      : value.substring(value.length - trailingWhitespace);

  return '$leading$localized$trailing';
}
