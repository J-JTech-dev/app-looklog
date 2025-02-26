import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';

import '../../../../common/theme/colors.dart';
import '../widget/textField/sign_in_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: AppConfig.h(130),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: GRAY_3, width: AppConfig.w(2))
                )
              ),
              padding: EdgeInsets.only(top: AppConfig.h(80)),
              child: Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:() {
                        Navigator.pop(context);
                      },
                      child: SizedBox(
                          width: AppConfig.w(30),
                          child: Image.asset('assets/icons/left_arrow_icon.png', width: AppConfig.w(9),height: AppConfig.h(13),)),
                    ),
                    SizedBox(width: AppConfig.w(30)),
                    Text('회원가입',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: BRACK_2,
                      fontWeight: FontWeight.w600,
                    ),),
                    const SizedBox(
                      width: 110,
                      height: 10)
                  ],
                ),
              ),
            ),
            const SignInTextField()
          ],
        ),
      ),
    );
  }
}
