import 'package:app_looklog/features/home/view/controller/menu_controller.dart';
import 'package:app_looklog/features/todaylook/view/page/look_create_screen.dart';
import 'package:app_looklog/features/todaylook/view/page/today_look_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data/models/today_item_model.dart';

part 'today_look_router.g.dart';

@riverpod
GoRouter todayLookRouter(TodayLookRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, GoRouterState state) async {
      await Future.delayed(const Duration(milliseconds: 50));

      if (state.uri.path.contains('insert')) {
        //메뉴버튼 안보이게
        ref.read(menuProvider.notifier).menuVisibleCheck(false);
      } else {
        //다른 화면으로 가면 보이게
        ref.read(menuProvider.notifier).menuVisibleCheck(true);
      }
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
        // routes: [
        //   GoRoute(
        //     path: 'insert',
        //     pageBuilder: (context, state) {
        //       return CustomTransitionPage(
        //           child: LookCreateScren(),
        //           transitionDuration: const Duration(milliseconds: 100),
        //           transitionsBuilder:
        //               (context, animation, secondaryAnimation, child) {
        //             return FadeTransition(
        //               opacity: animation,
        //               child: child,
        //             );
        //           });
        //     },
        //   ),
        // ]
      ),
      GoRoute(
        path: '/insert/:day',
        pageBuilder: (context, state) {
          final TodayItemModel data = state.extra as TodayItemModel;

          return CustomTransitionPage(
              child: LookCreateScreen(
                imgUrl: data.imageUrl,
                content: data.content,
                day: state.pathParameters['day']!,
              ),
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

    ],
  );
}
