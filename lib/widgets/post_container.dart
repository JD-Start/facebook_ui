import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({required this.post, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _postHeader(
                  post: post,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  post.caption.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : const SizedBox(
                        height: 6,
                      ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: CachedNetworkImage(imageUrl: post.imageUrl.toString()),
                )
              : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostStates(post: post),
          )
        ],
      ),
    );
  }
}

class _postHeader extends StatelessWidget {
  final Post post;

  const _postHeader({required this.post});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imgURL: post.user.imageUrl),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo} - ',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                  const Icon(Icons.public, size: 12)
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('More'),
          icon: const Icon(Icons.more_horiz, size: 24),
        ),
      ],
    );
  }
}

class _PostStates extends StatelessWidget {
  final Post post;
  const _PostStates({required this.post});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Palette.facebookBlue,
              ),
              child: const Icon(Icons.thumb_up_sharp,
                  size: 10, color: Colors.white),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                post.likes.toString(),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${post.shares} Shares',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
        ),
        Row(
          children: [
            _PostButton(
                icon: Icon(MdiIcons.thumbUpOutline,
                    color: Colors.grey.shade600, size: 20),
                label: 'Like',
                onTap: () => print('Like')),
            _PostButton(
                icon: Icon(MdiIcons.commentOutline,
                    color: Colors.grey.shade600, size: 20),
                label: 'Comment',
                onTap: () => print('Comment')),
            _PostButton(
                icon: Icon(MdiIcons.shareOutline,
                    color: Colors.grey.shade600, size: 25),
                label: 'Share',
                onTap: () => print('share')),
          ],
        ),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final void Function() onTap;

  const _PostButton(
      {required this.label, required this.icon, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                const SizedBox(
                  width: 4,
                ),
                Text(label),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
