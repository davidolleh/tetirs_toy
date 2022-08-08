import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tetris/router/router.gr.dart';

class SelectGamePage extends StatelessWidget {
  const SelectGamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('tetris'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          selectGameContainer('solo', () => AutoRouter.of(context).push(const GameRoute())),
          const SizedBox(height: 20,),
          selectGameContainer('duo', () => null),
        ],
      ),
    );
  }

  Widget selectGameContainer(String text, Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40
            ),
          ),
        ),
      ),
    );
  }
}
