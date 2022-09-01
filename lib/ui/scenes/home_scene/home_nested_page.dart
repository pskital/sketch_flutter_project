import 'package:flutter/material.dart';

class HomeNestedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _test() ? const Center(child: Text('Home nested')) : Container(),
    );
  }

  bool _test() {
    //testing debug inline watches
    return 1 == 1 ? true : false;
  }
}
