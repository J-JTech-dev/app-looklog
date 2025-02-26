import 'package:app_looklog/features/login/view/widget/popup/success_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../core/config/app_config.dart';

class SignInTextField extends StatefulWidget {
  const SignInTextField({super.key});

  @override
  State<SignInTextField> createState() => _SignInTextFieldState();
}

class _SignInTextFieldState extends State<SignInTextField> {
  final _idFormKey = GlobalKey<FormState>();
  final _pwFormKey = GlobalKey<FormState>();
  final _rePwFormKey = GlobalKey<FormState>();
  final _nameFormKey = GlobalKey<FormState>();
  String id = '';
  String pw = '';
  String rePw = '';
  String name = '';

  InputDecoration customInputDecoration(BuildContext context, String hint) {
    return InputDecoration(
      counterText: '',
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: GRAY_5, width: 2.0), // 비활성화 상태에서 밑줄 색상
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: GRAY_5, width: 2.0), // 활성화 상태에서 밑줄 색상
      ),
      hintText: '$hint 입력하세요.',
      hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: GRAY_3,
        fontWeight: FontWeight.w500,
      ),
      errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: RED_1,
        fontWeight: FontWeight.w500,
      ),
      errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0), // 오류 상태에서 밑줄 색상
      ),
      focusedErrorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2.0), // 오류 상태에서 포커스된 밑줄 색상
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConfig.h(65), left: AppConfig.w(32)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('아이디*', style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: MAIN_COLOR,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: AppConfig.h(10)),
          Row(
            children: [
              SizedBox( //아이디 입력
                width: AppConfig.w(228),
                height: AppConfig.h(50),
                child: Form(
                  key: _idFormKey,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '*필수입력 항목입니다.';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        id = value!;
                      });
                    },
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: AppConfig.r(15),
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: customInputDecoration(context, '아이디를')
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final formKeyState = _idFormKey.currentState!;
                  if (formKeyState.validate()) {
                    formKeyState.save();
                  }
                },
                child: Container(
                  width: AppConfig.w(86),
                  height: AppConfig.h(38),
                  margin: EdgeInsets.only(left: AppConfig.w(7), bottom: AppConfig.h(5)),
                  decoration: BoxDecoration(
                    color: MAIN_COLOR,
                    borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8)))
                  ),
                  child: Center(
                    child: Text(
                      '중복확인',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: WHITE,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: AppConfig.h(12)),
          Text('비밀번호*', style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: MAIN_COLOR,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: AppConfig.h(10)),
          SizedBox( //비밀번호 입력
            width: AppConfig.w(321),
            height: AppConfig.h(50),
            child: Form(
              key: _pwFormKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '*필수입력 항목입니다.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    pw = value!;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    // 비밀번호 입력이 바뀔 때마다 두 필드 값을 비교해서 에러 상태를 업데이트
                    _rePwFormKey.currentState?.validate();
                  });
                },
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: AppConfig.r(15),
                  fontWeight: FontWeight.w500,
                ),
                decoration: customInputDecoration(context, '비밀번호를')

              ),
            ),
          ),
          SizedBox( //비밀번호 재입력
            width: AppConfig.w(321),
            height: AppConfig.h(50),
            child: Form(
              key: _rePwFormKey,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return '비밀번호가 일치하지 않습니다.';
                  }
                  if (value != pw) {
                    return '비밀번호가 일치하지 않습니다.';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    rePw = value!;
                  });
                },
                onChanged: (value) {
                  setState(() {
                    // 두 필드 값 비교하여 에러 상태를 업데이트
                    _rePwFormKey.currentState?.validate();
                  });
                },
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: AppConfig.r(15),
                  fontWeight: FontWeight.w500,
                ),
                decoration: customInputDecoration(context, '비밀번호를 다시')
              ),
            ),
          ),
          SizedBox(height: AppConfig.h(12)),
          Text('닉네임*', style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: MAIN_COLOR,
            fontWeight: FontWeight.w500,
          ),),
          Row(
            children: [
              SizedBox( //닉네임 입력
                width: AppConfig.w(228),
                height: AppConfig.h(50),
                child: Form(
                  key: _nameFormKey,
                  child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return '*필수입력 항목입니다.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        setState(() {
                          name = value!;
                        });
                      },
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: AppConfig.r(15),
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: customInputDecoration(context, '사용할 닉네임을')
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  final formKeyState = _nameFormKey.currentState!;
                  if (formKeyState.validate()) {
                    formKeyState.save();
                  }
                },
                child: Container(
                  width: AppConfig.w(86),
                  height: AppConfig.h(38),
                  margin: EdgeInsets.only(left: AppConfig.w(7), bottom: AppConfig.h(5)),
                  decoration: BoxDecoration(
                      color: MAIN_COLOR,
                      borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8)))
                  ),
                  child: Center(
                    child: Text(
                      '중복확인',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: WHITE,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.zero,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConfig.r(15))), // 모서리 둥글게
                    content:  const SizedBox(
                        width: 333,
                        height: 234,
                        child: SuccessPopup()),
                  );
                },
              );
            },
            child: Container(
              width: AppConfig.w(299),
              height: AppConfig.h(49),
              margin: EdgeInsets.only(top: AppConfig.h(192), left: AppConfig.w(7), right: AppConfig.w(5)),
              decoration: BoxDecoration(
                color: MAIN_COLOR,
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50)))
              ),
              child: Center(
                child: Text('회원가입',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: WHITE,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
