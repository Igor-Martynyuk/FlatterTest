import 'package:app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.movies),
        centerTitle: false,
      ),
      body: Center(child: Text("HomeScreen")),
    );
  }
}
