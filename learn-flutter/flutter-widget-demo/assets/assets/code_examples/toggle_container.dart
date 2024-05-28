// Name: Toggle Container Visibility
// Description: A widget that toggles the visibility of a container on button click.

import 'package:flutter/material.dart';

class ToggleContainer extends StatefulWidget {
  const ToggleContainer({super.key});

  @override
  _ToggleContainerState createState() => _ToggleContainerState();
}

class _ToggleContainerState extends State<ToggleContainer> {
  bool _isVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (_isVisible)
          Container(
            width: 100,
            height: 100,
            color: Colors.blue,
            child: const Center(
              child: Text(
                'Hello World',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _toggleVisibility,
          child: Text(_isVisible ? 'Hide Container' : 'Show Container'),
        ),
      ],
    );
  }
}