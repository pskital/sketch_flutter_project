import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Center(child: Text('home')),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pushNamed('/homeNested'),
            child: const Text('home nested ->'),
          )
        ],
      ),
    );
  }
}
