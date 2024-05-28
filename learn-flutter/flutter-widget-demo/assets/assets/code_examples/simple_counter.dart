// Name: Simple Counter
// Description: A simple counter with increment and decrement buttons.

import 'package:flutter/material.dart';

class SimpleCounter extends StatefulWidget {
  const SimpleCounter({super.key});

  @override
  _SimpleCounterState createState() => _SimpleCounterState();
}

class _SimpleCounterState extends State<SimpleCounter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Counter: $_counter',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text('Increment'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: _decrementCounter,
              child: const Text('Decrement'),
            ),
          ],
        ),
      ],
    );
  }
}