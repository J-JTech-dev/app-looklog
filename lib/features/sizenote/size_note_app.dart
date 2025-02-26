import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../common/theme/font_theme.dart';
import 'size_note_router.dart';

class SizeNoteApp extends ConsumerStatefulWidget {
  const SizeNoteApp({super.key});

  @override
  ConsumerState<SizeNoteApp> createState() => _SizeNoteAppState();
}

class _SizeNoteAppState extends ConsumerState<SizeNoteApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: FontTheme.themeData(context),
      routerConfig: ref.watch(sizeNoteRouterProvider),
    );
  }
}
