import 'package:get/get.dart';
import 'package:mini_project/screens/history/historyscreen.dart';
import 'package:mini_project/screens/home/homescreen.dart';
import 'package:mini_project/screens/setting/settingscreen.dart';
import 'package:mini_project/screens/favorite/favoritescreen.dart';
class AppRoutes {
  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      // binding: SampleBind(),
    ),
    GetPage(
      name: '/history',
      page: () => HistoryScreen(),
      // binding: SampleBind(),
    ),
    GetPage(
      name: '/setting',
      page: () => SettingScreen(),
      // binding: SampleBind(),
    ),
        GetPage(
      name: '/favorite',
      page: () => FavoriteScreen(),
      // binding: SampleBind(),
    ),
  ];
}
