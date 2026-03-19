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
            decoration: const BoxDecoration(color: Colors.blueAccent),
            child: Center(
                child: Text(labels?.seacrh?.title,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                        color: Colors.white))),
          ),
          ListTile(
            leading: const Icon(Icons.search_outlined),
            title: Text(labels?.sidebar?.title),
            onTap: () => Get.toNamed("/home"),
          ),
          ListTile(
            leading: const Icon(Icons.history_edu_outlined),
            title: Text(labels?.history?.title),
            onTap: () => Get.toNamed("/history"),
          ),
          ListTile(
            leading: const Icon(Icons.star_border_outlined),
            title: Text(labels?.favorite?.title),
            onTap: () => Get.toNamed("/favorite"),
          ),
          ListTile(
            leading: const Icon(Icons.settings_applications_outlined),
            title: Text(labels?.setting?.title),
            onTap: () => Get.toNamed("/setting"),
          ),
        ],
      ),
    );
  }
}
