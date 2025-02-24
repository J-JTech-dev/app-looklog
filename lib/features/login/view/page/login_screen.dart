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
  @override
  Widget build(BuildContext context) {
    final autoLogin = ref.watch(loginProvider).isAutoLogin;

    return Scaffold(
      backgroundColor: BG_COLOR,
      body: Padding(
        padding:  EdgeInsets.only(top: AppConfig.h(150)),
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
                children: [
                  Text('아이디찾기', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: GRAY_12),),
                  Container(width: AppConfig.w(2),height: AppConfig.h(10),color: GRAY_3,margin: EdgeInsets.symmetric(horizontal: AppConfig.h(15))),
                  Text('비밀번호찾기', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: GRAY_12),),
                  Container(width: AppConfig.w(2),height: AppConfig.h(10),color: GRAY_3,margin: EdgeInsets.symmetric(horizontal: AppConfig.h(15))),
                  Text('회원가입', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: GRAY_12),),
                ],
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
    );
  }
}
