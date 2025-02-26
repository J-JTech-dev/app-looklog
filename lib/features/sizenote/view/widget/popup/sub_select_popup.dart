import 'package:app_looklog/common/theme/colors.dart';
import 'package:app_looklog/core/config/app_config.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../list/popup_data_list.dart';

class SubSelectPopup extends StatefulWidget {
  final String title;
  const SubSelectPopup({super.key, required this.title});

  @override
  State<SubSelectPopup> createState() => _SubSelectPopupState();
}

class _SubSelectPopupState extends State<SubSelectPopup> {
  List<String> testData = ['아우터', '상의','하의','신발', '테스트'];
  List<String> testTwoData = ['무신사', '육육걸즈','미쏘','에잇세컨즈'];
  List<String> testThreeData = ['옐로우', '레드','블루','블랙'];
  List<String> showData = [];

  @override
  Widget build(BuildContext context) {
    showData = [];
    showData.addAll(widget.title == '카테고리' ? testData : widget.title == '브랜드' ? testTwoData : testThreeData);

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: AppConfig.h(13)),
            Text(widget.title, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: BRACK_2, fontWeight: FontWeight.w800),),
            SizedBox(height: AppConfig.h(8)),
            SizedBox(
              width: AppConfig.sizeW,
              height: AppConfig.h(180),
              child: SingleChildScrollView(
                child: Column(
                  children: showData.mapIndexed((index, e) {
                    return PopupDataList(
                      index: index,
                      data: e,
                      type: widget.title
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(top: AppConfig.h(8), right: AppConfig.w(10)),
                child: Image.asset('assets/icons/popup_close_icon.png', width: AppConfig.w(31),height: AppConfig.h(31),),
              ),
            ))
      ],
    );
  }
}
