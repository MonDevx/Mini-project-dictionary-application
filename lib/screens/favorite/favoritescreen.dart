import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/components/drawer.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/body.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List _favorite;
  @override
  void initState() {
    super.initState();
    loadFavorite();
  }

  void loadFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList('favorite_list') != null) {
      setState(() {
        _favorite = prefs.getStringList('favorite_list');
      });
    }
  }

  void updatefavorite(List favorite) {
    setState(() {
      _favorite = favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(labels?.favorite?.title),
            Spacer(),
            IconButton(
              icon:
                  Icon(_favorite.isEmpty ? Icons.delete_forever : Icons.delete),
              onPressed: _favorite.isEmpty
                  ? null
                  : () {
                      Get.dialog(AlertDialog(
                        title: Text(labels?.favorite?.titleDialog),
                        content: Text(labels?.favorite?.contentDialog),
                        actions: [
                          FlatButton(
                            child: Text(labels?.favorite?.buttonCloseDialog),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          FlatButton(
                            child: Text(labels?.favorite?.buttonOkDialog),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("favorite_list");
                              setState(() {
                                _favorite.clear();
                              });

                              Get.back();
                              Get.snackbar(
                                labels?.favorite?.titleDialog,
                                labels?.favorite?.contentToalSnackBar,
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
      body: Body(_favorite, updatefavorite),
    );
  }
}
