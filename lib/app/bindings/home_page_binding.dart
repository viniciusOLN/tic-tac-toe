import 'package:get/get.dart';
import 'package:tic_tac_toe/app/controllers/home_page_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
