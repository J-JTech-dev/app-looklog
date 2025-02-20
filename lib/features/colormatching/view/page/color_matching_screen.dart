import 'package:flutter/material.dart';

class ColorMatchingScreen extends StatefulWidget {
  const ColorMatchingScreen({super.key});

  @override
  State<ColorMatchingScreen> createState() => _ColorMatchingScreenState();
}

class _ColorMatchingScreenState extends State<ColorMatchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
