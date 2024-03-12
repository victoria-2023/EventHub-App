import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      // Customizations here
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
