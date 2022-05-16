import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text("Jogo da Velha"),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => Get.toNamed('/home'),
                  child: const Text("Começar"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
