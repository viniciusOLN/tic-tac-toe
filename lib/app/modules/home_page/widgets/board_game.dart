import 'package:flutter/material.dart';
import 'package:tic_tac_toe/app/controllers/home_page_controller.dart';

class BoardGame extends StatelessWidget {
  HomePageController? controller;
  BoardGame({Key? key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: 9,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => controller?.pressButton(index),
          child: Container(
            color: controller?.tiles[index].color,
            child: Center(
              child: Text(
                controller!.tiles[index].symbol.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 72,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
