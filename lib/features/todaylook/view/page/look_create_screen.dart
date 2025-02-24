import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/todaylook/view/widget/popup/delete_popup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/theme/colors.dart';

class LookCreateScreen extends StatefulWidget {
  final String day;
  final String? imgUrl;
  final String? content;
  const LookCreateScreen({super.key, this.imgUrl, this.content, required this.day});

  @override
  State<LookCreateScreen> createState() => _LookCreateScreenState();
}

class _LookCreateScreenState extends State<LookCreateScreen> {
  String btnName = '등록';
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    btnName = widget.content != null ? '저장' : '등록';
    _controller = TextEditingController(text: widget.content ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: AppConfig.h(40), left: AppConfig.w(23), right: AppConfig.w(23)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:() {
                      context.go('/');
                    },
                    child: SizedBox(
                        width: AppConfig.w(30),
                        child: Image.asset('assets/icons/left_arrow_icon.png', width: AppConfig.w(12),height: AppConfig.h(20),)),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            contentPadding: EdgeInsets.zero, // 기본 패딩 제거
                            content: SizedBox(
                              width: AppConfig.w(314),
                              child: const DeletePopup()
                            )
                          );
                        },
                      );
                    },
                    child: Image.asset('assets/icons/trash_icon.png', width: AppConfig.w(30),height: AppConfig.h(30),))
                ],
              ),
              Container(
                width: AppConfig.w(216),
                height: AppConfig.h(280),
                color: GRAY_7,
                margin: EdgeInsets.only(top: AppConfig.h(40)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (widget.imgUrl != null)
                      Positioned.fill(
                        child: Image.asset(
                          widget.imgUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/edit_img.png',width: AppConfig.w(44),height: AppConfig.h(44),),
                        SizedBox(height: AppConfig.h(10),),
                        if (widget.imgUrl == null)
                        Text('사진을 넣어주세요.', style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: GRAY_6
                        ),)
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: AppConfig.w(316),
                height: AppConfig.h(93),
                margin: EdgeInsets.only(top: AppConfig.h(42),bottom: AppConfig.h(28)),
                padding: EdgeInsets.only(left: AppConfig.w(10), right: AppConfig.w(10), bottom: AppConfig.h(28)),
                decoration: BoxDecoration(
                  color: WHITE,
                  border: Border.all(color: GRAY_7),
                  borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
                ),
                child:  TextField(
                  controller: _controller,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: BRACK_2,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: '오늘의 옷은 어땠나요?',
                      hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: GRAY_3,
                        fontWeight: FontWeight.w500,
                      ),
                    border: InputBorder.none
                  ),
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: AppConfig.w(10)),
                  child: Text(widget.day,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: BRACK_2
                    ),
                  ),
                ),
              ), //넘겨준값 받기
              Container(
                width: AppConfig.w(316),
                height: AppConfig.h(53),
                margin: EdgeInsets.only(top: AppConfig.h(130),bottom: AppConfig.h(28)),
                decoration: BoxDecoration(
                    color: MAIN_COLOR,
                    borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
                ),
                child: Center(
                  child: Text(
                    btnName,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: WHITE
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
