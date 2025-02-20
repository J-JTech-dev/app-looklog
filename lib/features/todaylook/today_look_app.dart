import 'package:app_looklog/features/todaylook/today_look_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/theme/font_theme.dart';

class TodayLookApp extends ConsumerStatefulWidget {
  const TodayLookApp({super.key});

  @override
  ConsumerState<TodayLookApp> createState() => _TodayLookAppState();
}

class _TodayLookAppState extends ConsumerState<TodayLookApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: FontTheme.themeData(context),
      routerConfig: ref.watch(todayLookRouterProvider),
    );
  }
}
