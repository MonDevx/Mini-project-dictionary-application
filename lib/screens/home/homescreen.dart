import 'package:flutter/material.dart';
import 'package:mini_project/components/drawer.dart';
import 'package:mini_project/localization/localizations.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(labels?.seacrh?.title),
      ),
      drawer: MyDrawer(),
      body: Body(),
    );
  }
}
