import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';

import '../../../../common/theme/colors.dart';

class LookCreateScren extends StatefulWidget {
  const LookCreateScren({super.key});

  @override
  State<LookCreateScren> createState() => _LookCreateScrenState();
}

class _LookCreateScrenState extends State<LookCreateScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: AppConfig.h(40), left: AppConfig.w(23), right: AppConfig.w(23)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/icons/left_arrow_icon.png', width: AppConfig.w(25),height: AppConfig.h(25),),
                Image.asset('assets/icons/trash_icon.png', width: AppConfig.w(30),height: AppConfig.h(30),)
              ],
            ),
            Container(
              width: AppConfig.w(216),
              height: AppConfig.h(280),
              color: GRAY_7,
              margin: EdgeInsets.only(top: AppConfig.h(40)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/edit_img.png',width: AppConfig.w(44),height: AppConfig.h(44),),
                  SizedBox(height: AppConfig.h(10),),
                  Text('사진을 넣어주세요.', style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: GRAY_6
                  ),)
                ],
              ),
            ),
            Container(
              width: AppConfig.w(316),
              height: AppConfig.h(93),
              margin: EdgeInsets.only(top: AppConfig.h(42),bottom: AppConfig.h(28)),
              decoration: BoxDecoration(
                color: WHITE,
                border: Border.all(color: GRAY_7),
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
              ),
              child: TextField()
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: AppConfig.w(10)),
                child: Text('2025년 02월 14일',
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
                  '등록',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: WHITE
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
