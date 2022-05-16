import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/routes/app_pages.dart';
import 'package:tic_tac_toe/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'app/themes/theme_app.dart';

void main() {
  runApp(const TicTacToeApp());
}

class TicTacToeApp extends StatelessWidget {
  const TicTacToeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      initialRoute: Routes.INITIAL,
      getPages: AppPages.routes,
      theme: themeApp,
    );
  }
}
