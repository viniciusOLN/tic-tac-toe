import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/app/controllers/home_page_controller.dart';
import 'package:tic_tac_toe/app/modules/home_page/widgets/background_home_page.dart';
import 'package:tic_tac_toe/app/modules/home_page/widgets/board_game.dart';
import 'package:tic_tac_toe/app/utils/widgets/primary_button.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundHomePage(
      children: [
        Expanded(
          child: GetBuilder<HomePageController>(
            id: 'board',
            builder: (controller) {
              return BoardGame(
                controller: controller,
              );
            },
          ),
        ),
        PrimaryButton(
          onPressed: controller.resetBoard,
          child: const Text("Resetar"),
        ),
      ],
    );
  }
}
