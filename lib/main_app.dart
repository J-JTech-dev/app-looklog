import 'package:app_looklog/features/home/home_app.dart';
import 'package:app_looklog/features/home/view/widget/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/theme/colors.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

//테스트커밋
class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: BG_COLOR,
      body: Stack(
        children: [
          HomeApp(),
          MenuWidget(),
        ],
      ),
    );
  }
}
