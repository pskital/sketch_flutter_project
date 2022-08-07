import 'package:flutter/material.dart';

abstract class AppBarBaseWidget extends StatelessWidget
    with PreferredSizeWidget {
  AppBarBaseWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
