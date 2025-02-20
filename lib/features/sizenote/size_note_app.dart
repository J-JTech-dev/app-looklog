import 'package:app_looklog/features/sizenote/view/page/size_note_screen.dart';
import 'package:flutter/material.dart';

import '../../common/theme/font_theme.dart';

class SizeNoteApp extends StatefulWidget {
  const SizeNoteApp({super.key});

  @override
  State<SizeNoteApp> createState() => _SizeNoteAppState();
}

class _SizeNoteAppState extends State<SizeNoteApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: FontTheme.themeData(context),
      home: const SizeNoteScreen(),
    );
  }
}
