// Name: Toggle Between Different Containers
// Description: A widget that toggles between two containers with different colors and text.

import 'package:flutter/material.dart';

class ToggleBetweenContainers extends StatefulWidget {
  const ToggleBetweenContainers({super.key});

  @override
  _ToggleBetweenContainersState createState() => _ToggleBetweenContainersState();
}

class _ToggleBetweenContainersState extends State<ToggleBetweenContainers> {
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
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _showFirstContainer
              ? Container(
                  key: const ValueKey(1),
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
                  key: const ValueKey(2),
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