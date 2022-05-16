import 'package:get/get.dart';
import 'package:tic_tac_toe/app/bindings/home_page_binding.dart';
import 'package:tic_tac_toe/app/modules/home_page/home_page.dart';
import 'package:tic_tac_toe/app/modules/initial_page/initial_page.dart';
import 'package:tic_tac_toe/app/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const InitialPage(),
    ),
    GetPage(
      name: Routes.HOMEPAGE,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
  ];
}
