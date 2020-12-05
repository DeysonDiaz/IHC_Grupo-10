import 'package:flutter/material.dart';
import 'package:music_fit/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_fit/blocs/preferences_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

class Language extends StatefulWidget {
  const Language({Key key}) : super(key: key);

  String _localizeLocale(BuildContext context, Locale locale) {
    if (locale == null) {
      return AppLocalizations.of(context).systemLanguage;
    } else {
      final localeString = LocaleNames.of(context).nameOf(locale.toString());
      return localeString[0].toUpperCase() + localeString.substring(1);
    }
  }

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    final preferencesBloc = context.bloc<PreferencesBloc>();

    /*return ExpansionListCard<Locale>(
      title: AppLocalizations.of(context).language,
      subTitle: _localizeLocale(context, preferencesBloc.state.locale),
      leading: Icon(Icons.language, size: 48),
      items: [
        null,
        ...AppLocalizations.delegate.supportedLocales,
      ],
      itemBuilder: (locale) {
        return ExpansionCardItem(
          text: _localizeLocale(context, locale),
          onTap: () => preferencesBloc.add(ChangeLocale(locale)),
        );
      },
    );*/
  }
}
