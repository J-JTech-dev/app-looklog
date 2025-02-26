import 'package:app_looklog/features/login/view/page/sign_in_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/config/app_config.dart';
import '../controller/login_controller.dart';
import '../widget/textField/login_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {


  void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1.0, 0);  // 오른쪽에서 왼쪽으로 이동
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
        pageBuilder: (context, animation, secondaryAnimation) => page,
        fullscreenDialog: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final autoLogin = ref.watch(loginProvider).isAutoLogin;

    return Scaffold(
      backgroundColor: BG_COLOR,
      body: Padding(
        padding:  EdgeInsets.only(top: AppConfig.h(150)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RichText(
                text: TextSpan(
                children: [
                  TextSpan(
                    text: 'L',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: BLUE_1,
                      fontSize: AppConfig.w(32)
                    ),
                  ),
                  TextSpan(
                    text: 'OOKLOG',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: MAIN_COLOR,
                        fontSize: AppConfig.w(32)
                    ),
                  ),
                ],
              ),),
              SizedBox(height: AppConfig.h(62)),
              const LoginTextField(),
              GestureDetector(
                onTap: () {
                  ref.read(loginProvider.notifier).toggleAutoLogin();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: AppConfig.w(34)),
                  child: Row(
                    children: [
                      SizedBox(
                          child: Image.asset(autoLogin ? 'assets/icons/auto_login_icon.png':
                            'assets/icons/no_auto_login_icon.png', width: AppConfig.w(20),height: AppConfig.h(20),)),
                      SizedBox(width: AppConfig.w(13)),
                      Text('로그인 상태 유지', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: GRAY_11))
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppConfig.h(20)),
              Padding(
                padding: EdgeInsets.only(left: AppConfig.w(66)),
                child: Row(
                  children: List.generate(5, (index) {
                    if (index.isEven) {
                      // 텍스트 아이템 (아이디찾기, 비밀번호찾기, 회원가입)
                      return GestureDetector(
                        onTap: () {
                          switch (index ~/ 2) {
                            case 0:
                              print("아이디 찾기 클릭");
                              break;
                            case 1:
                              print("비밀번호 찾기 클릭");
                              break;
                            case 2:
                              navigateToPage(context, const SignInScreen());
                              break;
                          }
                        },
                        child: Text(
                          ['아이디찾기', '비밀번호찾기', '회원가입'][index ~/ 2],
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: GRAY_12),
                        ),
                      );
                    } else {
                      // 구분선 아이템
                      return Container(
                        width: AppConfig.w(2),
                        height: AppConfig.h(10),
                        color: GRAY_3,
                        margin: EdgeInsets.symmetric(horizontal: AppConfig.h(15)),
                      );
                    }
                  }),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppConfig.h(27), left: AppConfig.w(111)),
                child: Row(
                  children: [
                    Image.asset('assets/images/kakao_img.png',width: AppConfig.w(45),height: AppConfig.h(45),),
                    SizedBox(width: AppConfig.w(50)),
                    Image.asset('assets/images/google_img.png',width: AppConfig.w(45),height: AppConfig.h(45),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
