import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/components/drawer.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List _history;
  @override
  void initState() {
    super.initState();
    loadFavorite();
  }

  void loadFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('history_list') != null) {
      setState(() {
        _history = prefs.getStringList('history_list');
      });
    }
  }

  void updateHistory(List history) {
    setState(() {
      _history = history;
    });
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(labels?.history?.title),
            Spacer(),
            IconButton(
              icon:
                  Icon(_history.isEmpty ? Icons.delete_forever : Icons.delete),
              onPressed: _history.isEmpty
                  ? null
                  : () {
                      Get.dialog(AlertDialog(
                        title: Text(labels?.history?.titleDialog),
                        content: Text(labels?.history?.contentDialog),
                        actions: [
                          FlatButton(
                            child: Text(labels?.history?.buttonCloseDialog),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          FlatButton(
                            child: Text(labels?.history?.buttonOkDialog),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("history_list");
                              setState(() {
                                _history.clear();
                              });

                              Get.back();
                              Get.snackbar(
                                labels?.history?.titleDialog,
                                labels?.history?.contentToalSnackBar,
                                colorText: Colors.white,
                                backgroundColor: Colors.green[400],
                                duration: Duration(seconds: 5),
                              );
                            },
                          )
                        ],
                      ));
                    },
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: Body(_history, updateHistory),
    );
  }
}
