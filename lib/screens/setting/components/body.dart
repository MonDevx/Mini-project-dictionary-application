import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_project/components/dropdownpicker.dart';
import 'package:mini_project/constants/globals.dart';
import 'package:mini_project/controllers/controllers.dart';
import 'package:mini_project/localization/localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Column(
          children: [
            languageListTile(context),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      labels?.setting?.cache,
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () {
                        Get.dialog(AlertDialog(
                            title: Text(labels?.setting?.cache),
                            content: Text(labels?.setting?.cachecontentdialog),
                            actions: [
                              FlatButton(
                                child:
                                    Text(labels?.favorite?.buttonCloseDialog),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                              FlatButton(
                                child: Text(labels?.favorite?.buttonOkDialog),
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.clear();
                                  Get.back();
                                },
                              ),
                            ]));
                      },
                      color: Colors.blue,
                      child: Text(
                        labels?.setting?.cachebutton,
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

languageListTile(BuildContext context) {
  final labels = AppLocalizations.of(context);
  return GetBuilder<LanguageController>(
    builder: (controller) => ListTile(
      title: Text(labels?.setting?.languageslabel),
      trailing: DropdownPicker(
        menuOptions: Globals.languageOptions(context),
        selectedOption: controller.currentLanguage,
        onChanged: (value) async {
          await controller.updateLanguage(value);
          Get.forceAppUpdate();
        },
      ),
    ),
  );
}
