import 'package:app_looklog/core/config/app_config.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../sizenote/data/datasources/dummy_data.dart';
import '../list/color_list.dart';

class BottomModalPopup extends StatefulWidget {
  final String type;
  const BottomModalPopup({super.key, required this.type});

  @override
  State<BottomModalPopup> createState() => _BottomModalPopupState();
}

class _BottomModalPopupState extends State<BottomModalPopup> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 460,
          padding: EdgeInsets.only(top: AppConfig.h(40),left: AppConfig.w(30),right: AppConfig.w(30)), // 전체 여백 추가
          child: GridView.count(
            crossAxisCount: 4, // 한 줄에 4개씩 배치
            childAspectRatio: 6/7, // 🔹 세로 비율을 더 늘림 (값을 줄이면 세로가 길어짐)
            crossAxisSpacing: 5, // 아이템 사이 가로 간격
            mainAxisSpacing: 5, // 아이템 사이 세로 간격
            shrinkWrap: true, // 🔹 내용 높이에 맞게 크기 조절
            children: DummyData.colorList.mapIndexed((index, e) {
              return ColorList(
                index: index,
                colors: e['color'],
                name: e['name'],
                type: widget.type,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
