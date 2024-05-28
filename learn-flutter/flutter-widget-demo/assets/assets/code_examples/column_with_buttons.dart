// Name: Column with Different Buttons
// Description: A column containing different types of buttons.

import 'package:flutter/material.dart';

class ColumnWithButtons extends StatelessWidget {
  const ColumnWithButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated Button'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: const Text('Text Button'),
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Outlined Button'),
          ),
        ],
      ),
    );
  }
}