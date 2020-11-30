import 'package:flutter/material.dart' show AppBar, BuildContext, Scaffold, StatelessWidget, Text, Widget;

import 'package:mini_project/localization/localizations.dart';
import 'package:mini_project/widgets/drawer.dart';

import 'components/body.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(labels?.setting?.title),
      ),
      drawer: MyDrawer(),
      body: Body(),
    );
  }
}
