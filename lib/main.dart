import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

import 'Screens/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Facebook UI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Palette.scaffold,
        ),
        debugShowCheckedModeBanner: false,
        home: const NavScreen());
  }
}
