import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  List<User>? onlineUsers;
  Rooms({required this.onlineUsers, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers!.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: _CreateRoomButton(),
            );
          }
          final User user = onlineUsers![index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(imgURL: user.imageUrl, isActive: true),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton();
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
            const TextStyle(color: Palette.facebookBlue)),
        side: MaterialStateProperty.all(
            BorderSide(width: 3, color: Colors.blue.shade300)),
        // elevation: const MaterialStatePropertyAll(8),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        fixedSize: MaterialStateProperty.all(const Size(100, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      onPressed: () => print('Create Room'),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                Palette.createRoomGradient.createShader(bounds),
            child: const Icon(
              Icons.video_call,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          const Text(
            'Create\nRoom',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
