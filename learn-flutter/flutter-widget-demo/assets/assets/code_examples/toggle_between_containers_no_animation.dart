// Name: Toggle Between Different Containers Without Animation
// Description: A widget that toggles between two containers with different colors and text without animation.

import 'package:flutter/material.dart';

class ToggleBetweenContainersNoAnimation extends StatefulWidget {
  const ToggleBetweenContainersNoAnimation({super.key});

  @override
  _ToggleBetweenContainersNoAnimationState createState() => _ToggleBetweenContainersNoAnimationState();
}

class _ToggleBetweenContainersNoAnimationState extends State<ToggleBetweenContainersNoAnimation> {
  bool _showFirstContainer = true;

  void _toggleContainer() {
    setState(() {
      _showFirstContainer = !_showFirstContainer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _showFirstContainer
            ? Container(
                width: 100,
                height: 100,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Container 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            : Container(
                width: 100,
                height: 100,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Container 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _toggleContainer,
          child: const Text('Toggle Container'),
        ),
      ],
    );
  }
}