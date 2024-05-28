// Name: Container with Border
// Description: A container with a red border and "Hello World" text centered inside.

import 'package:flutter/material.dart';

class ContainerWithBorder extends StatelessWidget {
  const ContainerWithBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 4),
        ),
        width: 200,
        height: 200,
        child: const Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}