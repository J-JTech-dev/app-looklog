import 'package:flutter/material.dart';

class WeatherImageWidget extends StatefulWidget {
  final String fileUrl;
  const WeatherImageWidget({super.key, required this.fileUrl});

  @override
  State<WeatherImageWidget> createState() => _WeatherImageWidgetState();
}

class _WeatherImageWidgetState extends State<WeatherImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(widget.fileUrl);
  }
}
