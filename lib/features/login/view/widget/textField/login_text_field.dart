import 'package:app_looklog/features/login/view/controller/login_controller.dart';
import 'package:app_looklog/main_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../core/config/app_config.dart';

class LoginTextField extends ConsumerStatefulWidget {
  const LoginTextField({super.key});

  @override
  ConsumerState<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends ConsumerState<LoginTextField> {
  late TextEditingController _idController;
  late TextEditingController _pwController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController();
    _pwController = TextEditingController();
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visible = ref.watch(loginProvider).isVisible;

    return Column(
      children: [
        Container(
          width: AppConfig.w(307),
          height: AppConfig.h(46),
          margin: EdgeInsets.only(bottom: AppConfig.h(14)),
          padding: EdgeInsets.only(top: AppConfig.h(4), left: AppConfig.w(16)),
          decoration: BoxDecoration(
              color: WHITE_1,
              border: Border.all(color: GRAY_3),
              borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8)))
          ),
          child: TextField(
            controller: _idController,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: BRACK_2,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
                hintText: '아이디를 입력하세요.',
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: GRAY_2,
                ),
                border: InputBorder.none
            ),
          )
        ),
        Container(
            width: AppConfig.w(307),
            height: AppConfig.h(46),
          padding: EdgeInsets.only(top: AppConfig.h(4), left: AppConfig.w(10)),
          decoration: BoxDecoration(
              color: WHITE_1,
              border: Border.all(color: GRAY_3),
              borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8)))
          ),
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextField(
                controller: _idController,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: BRACK_2,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                    hintText: '비밀번호를 입력하세요.',
                    hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: GRAY_2,
                    ),
                    border: InputBorder.none
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(loginProvider.notifier).toggleVisible();
                },
                child: Padding(
                  padding: EdgeInsets.only(right: AppConfig.w(15)),
                  child: Image.asset(visible ? 'assets/icons/visible_icon.png':
                    'assets/icons/unvisible_icon.png', width: AppConfig.w(20),height: AppConfig.h(20),),
                ),
              )
            ],
          )
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0);
                  var end = Offset.zero;
                  var curve = Curves.ease;
                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(
                    CurveTween(
                      curve: curve,
                    ),
                  );
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const MainApp(),
                fullscreenDialog: false,
              ),
            );
          },
          child: Container(
            width: AppConfig.w(316),
            height: AppConfig.h(53),
            margin: EdgeInsets.only(top: AppConfig.h(15),bottom: AppConfig.h(15)),
            decoration: BoxDecoration(
                color: MAIN_COLOR,
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
            ),
            child: Center(
              child: Text(
                '로그인',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: WHITE,
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
