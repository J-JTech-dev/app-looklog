import 'package:flutter/material.dart';

import '../../common/theme/font_theme.dart';
import 'view/page/color_matching_screen.dart';

class ColorMatchingApp extends StatefulWidget {
  const ColorMatchingApp({super.key});

  @override
  State<ColorMatchingApp> createState() => _ColorMatchingAppState();
}

class _ColorMatchingAppState extends State<ColorMatchingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FontTheme.themeData(context),
      home: const ColorMatchingScreen(),
    );
  }
}
