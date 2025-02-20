import 'package:app_looklog/features/todaylook/view/page/look_create_screen.dart';
import 'package:app_looklog/features/todaylook/view/page/today_look_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'today_look_router.g.dart';

@riverpod
GoRouter todayLookRouter(TodayLookRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, GoRouterState state) async {
      await Future.delayed(const Duration(milliseconds: 50));

      // if (state.uri.path.contains('payment-proessing')) {
      //   //홈버튼 안 보이게
      //   ref.read(homeBtnVisibleProvider.notifier).state = false;
      // } else {
      //   //다른 화면으로 가면 보이게
      //   ref.read(homeBtnVisibleProvider.notifier).state = true;
      // }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: TodayLookScreen(key: UniqueKey())
          );
        },
        routes: [
          GoRoute(
            path: 'insert',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  child: LookCreateScren(),
                  transitionDuration: const Duration(milliseconds: 100),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  });
            },
          ),
        ]
      ),

    ],
  );
}
