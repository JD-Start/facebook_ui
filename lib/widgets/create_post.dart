import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:facebook_ui/models/models.dart';

class CreatePostConainer extends StatelessWidget {
  final User currentUser;
  const CreatePostConainer({super.key, required this.currentUser});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12.0, 8, 12, 0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imgURL: currentUser.imageUrl),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            height: 10,
            thickness: 2,
            indent: 32,
            endIndent: 32,
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                  label: const Text(
                    'Live',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => print('Live'),
                  icon: Icon(Icons.videocam,
                      size: 24, color: Colors.red.shade300),
                ),
                VerticalDivider(
                  width: 8,
                  indent: 5,
                  endIndent: 5,
                  thickness: 2,
                  color: Colors.grey.shade300,
                ),
                TextButton.icon(
                  label: const Text(
                    'Photo',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => print('Photo'),
                  icon: Icon(Icons.photo_library,
                      size: 24, color: Colors.green.shade300),
                ),
                VerticalDivider(
                  width: 8,
                  indent: 5,
                  endIndent: 5,
                  thickness: 2,
                  color: Colors.grey.shade300,
                ),
                TextButton.icon(
                  label: const Text(
                    'Room',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () => print('Room'),
                  icon: Icon(Icons.video_call,
                      size: 24, color: Colors.red.shade300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
