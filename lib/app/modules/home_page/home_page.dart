import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/app/controllers/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GetBuilder<HomePageController>(
              id: 'board',
              builder: (controller) {
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
                      onTap: () => controller.pressButton(index),
                      child: Container(
                        color: controller.tiles[index].color,
                        child: Center(
                          child: Text(
                            controller.tiles[index].symbol.toString(),
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
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.resetBoard(),
            child: Text("Resetar"),
          ),
        ],
      ),
    );
  }
}
