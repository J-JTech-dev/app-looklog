import 'package:app_looklog/common/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/config/app_config.dart';
import '../../../login_app.dart';

class SuccessPopup extends StatefulWidget {
  const SuccessPopup({super.key});

  @override
  State<SuccessPopup> createState() => _SuccessPopupState();
}

class _SuccessPopupState extends State<SuccessPopup> {
  @override
  Widget build(BuildContext context) {
    return Column(
    mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppConfig.h(25)),
        Text('회원가입 성공',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: BRACK_2,
            fontWeight: FontWeight.w800,
          ),),
        SizedBox(height: AppConfig.h(25)),
        Text('가입이 완료되었습니다.\n나만의 스타일 히스토리를 쌓아보세요!',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: BRACK_2,
            fontWeight: FontWeight.w500,
          ),),
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // 먼저 팝업을 닫음
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(-1.0, 0);
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
                pageBuilder: (context, animation, secondaryAnimation) => const LoginApp(),
                fullscreenDialog: false,
              ),
            );
          },
          child: Container(
            height: AppConfig.h(50),
            margin: EdgeInsets.only(top: AppConfig.h(32.74)),
            decoration: BoxDecoration(
              color: MAIN_COLOR,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(AppConfig.r(14)), bottomRight: Radius.circular(AppConfig.r(14))),
            ),
            child: Center(
              child: Text('로그인하러가기',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: WHITE,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
