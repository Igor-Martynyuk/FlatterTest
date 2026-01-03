import 'package:app/core/const.dart';
import 'package:app/l10n/app_localizations.dart';
import 'package:app/layer/ui/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App();

  final String _code_en = 'en';
  final String _code_ua = 'uk';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Const.appName,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Root(),
    );
  }
}
