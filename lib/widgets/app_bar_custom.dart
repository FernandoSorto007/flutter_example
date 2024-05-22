import 'package:flutter/material.dart';
import 'package:ugb/resources/assets_colors.dart';
import 'package:ugb/resources/assets_strings.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 200,
      backgroundColor: AssetsColor.colorSecondary,
      title: const Text(AssetsString.title),
    );
  }
}
