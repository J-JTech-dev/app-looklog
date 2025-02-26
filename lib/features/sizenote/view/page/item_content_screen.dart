import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/sizenote/view/page/size_content.dart';
import 'package:app_looklog/features/sizenote/view/widget/button/radio_button.dart';
import 'package:app_looklog/features/sizenote/view/widget/list/category_list.dart';
import 'package:app_looklog/features/sizenote/view/widget/list/sub_menu_list.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../common/theme/colors.dart';
import '../controller/size_note_controller.dart';

class ItemContentScreen extends ConsumerStatefulWidget {
  const ItemContentScreen({super.key});

  @override
  ConsumerState<ItemContentScreen> createState() => _ItemContentScreenState();
}

class _ItemContentScreenState extends ConsumerState<ItemContentScreen> {
  List<String> subTitle = ['카테고리', '브랜드', '색상'];
  List<String> categoryTitle = ['상의', '하의', '신발'];
  List<String> radioBtn = ['cm', 'inch'];
  late TextEditingController _controller;
  late TextEditingController _dressNmcontroller;
  late TextEditingController _dateController;
  String btnName = '등록';
  DateTime date = DateTime.now();

  @override
  void initState() {
    super.initState();
    // btnName = widget.content != null ? '저장' : '등록';
    _controller = TextEditingController(text: '');
    _dressNmcontroller = TextEditingController(text: '');
    _dateController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _controller.dispose();
    _dressNmcontroller.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeIndex = ref.watch(selectIndexProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: AppConfig.w(150),
            height: AppConfig.h(30),
            margin: EdgeInsets.only(left: AppConfig.w(0)),
            child: TextField(
              controller: _dressNmcontroller,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: BRACK_2,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                  hintText: '옷이름.',
                  hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: GRAY_3,
                    fontWeight: FontWeight.w500,
                  ),
              ),
            ),
          ),
          Column(
            children: subTitle.mapIndexed((index,e) {
              return SubMenuList(index: index, title: e, );
            }).toList(),
          ),
          SizedBox(height: AppConfig.h(38)),
          Row(
            children: [
              Container(//상의하의신발 선택버튼
                width: AppConfig.w(192),
                height: AppConfig.h(40),
                margin: EdgeInsets.only(left: AppConfig.w(17)),
                decoration: BoxDecoration(
                    color: GRAY_4,
                  borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(30)))
                ),
                child: Row(
                  children: categoryTitle.mapIndexed((index, element) {
                    return CategoryList(index: index, title: element);
                  }).toList(),
                ),
              ),
              Container(//단위 선택
                width: AppConfig.w(100),
                height: AppConfig.h(40),
                margin: EdgeInsets.only(left: AppConfig.w(47)),
                child:
                Row(
                  children: radioBtn.mapIndexed((index, element) {
                    return Expanded(
                      child: RadioButton(
                        index: index,
                        value: element,
                      ),
                    );
                  }).toList()
                ),
              )
            ],
          ),
          Container( //사이즈 입력
            width: AppConfig.w(341),
            height: AppConfig.h(sizeIndex == 1 ? 230 : 180),
            margin: EdgeInsets.only(top: AppConfig.h(14)),
            decoration: BoxDecoration(
                color: WHITE,
                border: Border.all(color: GRAY_8.withOpacity(0.5)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: AppConfig.r(4),
                    color: GRAY_8.withOpacity(AppConfig.r(0.25)),
                    offset: Offset(0, AppConfig.w(2)),
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
            ),
            child: SizeContent(),
          ),
          Row( //사이즈 후기 입력
            children: [
              Container(
                  width: AppConfig.w(52),
                  margin: EdgeInsets.only(top: AppConfig.h(25), left: AppConfig.w(25)),
                  child: Text('사이즈', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1),)),
              Container(
                width: AppConfig.w(250),
                height: AppConfig.h(40),
                margin: EdgeInsets.only(top: AppConfig.h(25), left: AppConfig.w(30)),
                child: TextField(
                  controller: _controller,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: BRACK_2,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                      hintText: '사이즈 후기를 입력해주세요.',
                      hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: GRAY_3,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none
                  ),
                ),
              )
            ],
          ),
          Row( //구매날짜 입력
            children: [
              Container(
                  width: AppConfig.w(52),
                  margin: EdgeInsets.only(top: AppConfig.h(10), left: AppConfig.w(25)),
                  child: Text('구매날짜', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1),)),
              Container(
                width: AppConfig.w(250),
                height: AppConfig.h(40),
                margin: EdgeInsets.only(top: AppConfig.h(10), left: AppConfig.w(30)),
                child: TextField(
                  controller: _dateController,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: BRACK_2,
                    fontWeight: FontWeight.w500,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true), // 숫자만 입력
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10), // 최대 10자 (YYYY.MM.DD)
                    FilteringTextInputFormatter.digitsOnly, // 숫자만 허용
                    _DateFormatter(),
                  ],
                  decoration: InputDecoration(
                      hintText: '사이즈 후기를 입력해주세요.',
                      hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: GRAY_3,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none
                  ),
                ),
              )
            ],
          ),
          Container(//저장버튼
            width: AppConfig.w(316),
            height: AppConfig.h(53),
            margin: EdgeInsets.only(top: AppConfig.h(20),bottom: AppConfig.h(28)),
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
    );
  }
}

class _DateFormatter extends TextInputFormatter {
  final _dateFormat = DateFormat('yyyy.MM.dd');

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String newText = newValue.text;

    // 숫자만 입력되도록 필터링
    newText = newText.replaceAll(RegExp(r'[^0-9]'), '');

    // 10자 이상이면 잘라냄
    if (newText.length > 10) {
      newText = newText.substring(0, 10);
    }

    // 입력된 텍스트가 4자마다 .를 추가하여 날짜 형식으로 변환
    if (newText.length >= 5) {
      newText = '${newText.substring(0, 4)}.${newText.substring(4)}';
    }
    if (newText.length >= 8) {
      newText = '${newText.substring(0, 7)}.${newText.substring(7)}';
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
