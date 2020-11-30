import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mini_project/localization/localizations.dart';

// ========== Drawer ===========
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context);
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            child: Center(
                child: Text(labels?.seacrh?.title,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Colors.white))),
          ),
          FlatButton.icon(
            onPressed: () => Get.toNamed("/home"),
            icon: Icon(Icons.search_outlined),
            label: Text(labels?.sidebar?.title),
          ),
          FlatButton.icon(
              onPressed: () => Get.toNamed("/history"),
              icon: Icon(Icons.history_edu_outlined),
              label: Text(labels?.history?.title)),
          FlatButton.icon(
              onPressed: () => Get.toNamed("/favorite"),
              icon: Icon(Icons.star_border_outlined),
              label: Text(labels?.favorite?.title)),
          FlatButton.icon(
              onPressed: () => Get.toNamed("/setting"),
              icon: Icon(Icons.settings_applications_outlined),
              label: Text(labels?.setting?.title)),
        ],
      ),
    );
  }
}
