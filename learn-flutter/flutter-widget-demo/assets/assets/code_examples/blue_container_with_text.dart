// Name: Blue Container with Centered Text
// Description: A blue container with "Hello World" text centered inside.

import 'package:flutter/material.dart';

class BlueContainerWithText extends StatelessWidget {
  const BlueContainerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        width: 200,
        height: 200,
        child: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}