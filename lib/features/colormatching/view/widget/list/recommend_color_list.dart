import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';

import '../../../../../common/theme/colors.dart';

class RecommendColorList extends StatefulWidget {
  final int index;
  final String colors;
  const RecommendColorList({super.key, required this.index, required this.colors});

  @override
  State<RecommendColorList> createState() => _RecommendColorListState();
}

class _RecommendColorListState extends State<RecommendColorList> {
  Color recommendColor = const Color(0XFF000000);

  @override
  Widget build(BuildContext context) {
    String hexColor = widget.colors.replaceAll('#', '');
    recommendColor = Color(int.parse('FF$hexColor', radix: 16));

    return Container(
      width: AppConfig.w(87),
      height: AppConfig.h(71),
      margin: EdgeInsets.only(left: widget.index == 0 ? AppConfig.w(46): 0, right: AppConfig.w(20)),
      decoration: BoxDecoration(
        color: recommendColor,
        border: Border.all(color: GRAY_3),
        borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
      ),
    );
  }
}
