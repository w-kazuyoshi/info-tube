import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;

  const AppBarWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
