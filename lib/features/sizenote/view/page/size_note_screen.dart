import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/sizenote/view/widget/tab/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class SizeNoteScreen extends StatefulWidget {
  const SizeNoteScreen({super.key});

  @override
  State<SizeNoteScreen> createState() => _SizeNoteScreenState();
}

class _SizeNoteScreenState extends State<SizeNoteScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(top: AppConfig.h(115)),
        child: const TabBarWidget(),
      ),
    );
  }
}
