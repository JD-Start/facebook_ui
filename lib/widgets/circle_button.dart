import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  IconData icon;
  double iconSize;
  Function? onPressed;

  CircleButton(
      {required this.icon, this.onPressed, required this.iconSize, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade300,
      ),
      child: IconButton(
        onPressed: () {
          void onPressed;
        },
        icon: Icon(
          icon,
          size: iconSize,
          color: Colors.black,
        ),
      ),
    );
  }
}
