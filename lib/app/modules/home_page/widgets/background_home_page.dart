import 'package:flutter/material.dart';

class BackgroundHomePage extends StatelessWidget {
  List<Widget> children;
  BackgroundHomePage({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[...children],
      ),
    );
  }
}
