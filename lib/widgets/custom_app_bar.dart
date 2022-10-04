import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/widgets/custom_tabbar.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomAppBar(
      {required this.selectedIndex,
      required this.currentUser,
      required this.onTap,
      required this.icons,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black,
          offset: Offset(0, 2),
          blurRadius: 2,
        )
      ]),
      child: Row(
        children: [
          const Text(
            'Facebook',
            style: TextStyle(
              fontSize: 32,
              color: Palette.facebookBlue,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
