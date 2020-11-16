import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/loading.dart';
import 'constants/constants.dart';
import 'controllers/controllers.dart';
import 'localization/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() {
  Get.put<LanguageController>(LanguageController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetBuilder<LanguageController>(
      builder: (languageController) => Loading(
        child: GetMaterialApp(
          //begin language translation stuff //https://github.com/aloisdeniel/flutter_sheet_localization
          locale: languageController.getLocale, // <- Current locale
          localizationsDelegates: [
            const AppLocalizationsDelegate(), // <- Your custom delegate
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales:
              AppLocalizations.languages.keys.toList(), // <- Supported locales
          //end language translation stuff
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          theme: ThemeData(
            fontFamily: 'Prompt',
            primarySwatch: Colors.blue,
          ),
          title: 'Dictionary ',
          initialRoute: "/home",
          getPages: AppRoutes.routes,
        ),
      ),
    );
  }
}
