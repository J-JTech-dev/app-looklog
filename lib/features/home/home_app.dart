import 'package:app_looklog/common/theme/font_theme.dart';
import 'package:app_looklog/features/home/view/page/home_screen.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FontTheme.themeData(context),
      home: const HomeScreen(),
    );
  }
}
