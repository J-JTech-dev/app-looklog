import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/colormatching/color_matching_app.dart';
import 'package:app_looklog/features/home/home_app.dart';
import 'package:app_looklog/features/home/view/widget/menu/menu_widget.dart';
import 'package:app_looklog/features/sizenote/size_note_app.dart';
import 'package:app_looklog/features/todaylook/today_look_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../common/theme/colors.dart';
import 'features/home/view/controller/menu_controller.dart';

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(menuProvider).index;
    final menuVisible = ref.watch(menuProvider).menuVisible;
    // final isScreen = ref.watch(menuProvider.select((state) => state.screenInit)); // 변경 감지

    // Future.microtask(() {
    //깜빡이듯이 보여서 일단 뺀다
    //   if (!isScreen) {
    //     print('🟡 screenInitCheck 실행!');
    //     ref.read(menuProvider.notifier).screenInitCheck();
    //   }
    // });
    // print('isScreen $isScreen');

    Widget selectScreen = (selectedIndex == -1) ? HomeApp() : (selectedIndex == 0) ? TodayLookApp() : (selectedIndex == 1) ? SizeNoteApp() : ColorMatchingApp();

    return  Scaffold(
      backgroundColor: BG_COLOR,
      body: Stack(
        children: [
          // !isScreen ?
          //     Center(
          //       child: SizedBox(
          //         width: AppConfig.w(50),
          //         height: AppConfig.h(50),
          //         child: Lottie.asset('assets/jsons/loading_one.json'),
          //       ),
          //     ):
          selectScreen,
          // HomeApp(),
          if (menuVisible)
          const MenuWidget(),
        ],
      ),
    );
  }
}
