import 'package:flutter/material.dart';
import 'package:sketch_flutter_project/core/extensions/translation_extension.dart';

class HomeNestedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('homeNested'.tr())),
    );
  }
}
