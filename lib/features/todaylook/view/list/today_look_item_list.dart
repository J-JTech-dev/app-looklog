import 'package:app_looklog/common/theme/colors.dart';
import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';

class TodayLookItemList extends StatefulWidget {
  final int index;
  final String imgUrl;
  final String content;

  const TodayLookItemList({super.key, required this.index, required this.imgUrl, required this.content});

  @override
  State<TodayLookItemList> createState() => _TodayLookItemListState();
}

class _TodayLookItemListState extends State<TodayLookItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: WHITE,
        borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8))),
        boxShadow: [
          BoxShadow(
            blurRadius: AppConfig.r(4),
            color: GRAY_3.withOpacity(AppConfig.r(0.25)),
            offset: Offset(0.0,AppConfig.h(2))
          )
        ]
      ),
      child: Column(
        children: [
          Container(
              width: AppConfig.sizeW,
              height: AppConfig.h(188),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8))),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConfig.r(8)), topRight: Radius.circular(AppConfig.r(8))),
                  child: Image.asset(widget.imgUrl, fit: BoxFit.cover,)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppConfig.h(11), horizontal: AppConfig.w(10)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('테스트', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: BRACK_2,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
