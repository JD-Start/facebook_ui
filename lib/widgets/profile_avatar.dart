import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final imgURL;
  final bool isActive;
  final bool hasBorder;

  const ProfileAvatar(
      {this.hasBorder = false,
      required this.imgURL,
      this.isActive = false,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: CachedNetworkImageProvider(imgURL),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Palette.online,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
