import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../models/post_model.dart';
import '../widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Facebook',
            style: TextStyle(
                fontSize: 28,
                color: Palette.facebookBlue,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          actions: [
            CircleButton(
              icon: Icons.search,
              iconSize: 30,
              onPressed: () => print('Search'),
            ),
            CircleButton(
              icon: MdiIcons.facebookMessenger,
              iconSize: 30,
              onPressed: () => print('Messenger'),
            ),
          ],
          centerTitle: false,
          floating: true,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        const SliverToBoxAdapter(
            child: CreatePostConainer(
          currentUser: currentUser,
        )),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(child: Rooms(onlineUsers: onlineUsers))),
        SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            sliver: SliverToBoxAdapter(
                child: Stories(currentUser: currentUser, stories: stories))),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: posts.length,
          (context, index) {
            final Post post = posts[index];
            return PostContainer(post: post);
          },
        ))
      ]),
    );
  }
}
