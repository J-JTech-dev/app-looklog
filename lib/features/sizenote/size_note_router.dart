import 'package:app_looklog/features/home/view/controller/menu_controller.dart';
import 'package:app_looklog/features/sizenote/view/page/item_insert_screen.dart';
import 'package:app_looklog/features/sizenote/view/page/item_screen.dart';
import 'package:app_looklog/features/sizenote/view/page/size_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'size_note_router.g.dart';

@riverpod
GoRouter sizeNoteRouter(SizeNoteRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, GoRouterState state) async {
      await Future.delayed(const Duration(milliseconds: 50));

      if (state.uri.path.contains('item')) {
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
              child: SizeNoteScreen(key: UniqueKey())
          );
        },
      ),
      GoRoute(
        path: '/item',
        pageBuilder: (context, state) {
          return NoTransitionPage(
            child: ItemScreen(key: UniqueKey())
          );
        },
        routes: [
          GoRoute(
            path: 'insert/:type',
            pageBuilder: (context, state) {
              return NoTransitionPage(
                  child: ItemInsertScreen(key: UniqueKey(),
                  type: state.pathParameters['type']!,
                  )
              );
            },
          ),
        ]
      ),

    ],
  );
}
