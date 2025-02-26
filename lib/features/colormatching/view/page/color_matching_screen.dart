import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/colormatching/view/widget/list/recommend_color_list.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../common/theme/colors.dart';
import 'dress_image_screen.dart';

class ColorMatchingScreen extends StatefulWidget {
  const ColorMatchingScreen({super.key});

  @override
  State<ColorMatchingScreen> createState() => _ColorMatchingScreenState();
}

class _ColorMatchingScreenState extends State<ColorMatchingScreen> {
  final List<String> colors = ['#FFFFFF', '#A1A1A1', '#5E4444'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: AppConfig.sizeW,
        child: Column(
          children: [
            const DressImageScreen(),// 상의하의신발 선택 이미지
            Column(
              children: [
                Container(
                    width: AppConfig.w(333),
                    margin: EdgeInsets.only(top: AppConfig.h(42), bottom: AppConfig.h(10)),
                    child: Text('이런 색을 추천해요!', textAlign: TextAlign.start,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: BRACK_1),)),
                Row(
                  children: colors.mapIndexed((index,e) {
                    return RecommendColorList(
                        index:index,
                        colors: e
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
