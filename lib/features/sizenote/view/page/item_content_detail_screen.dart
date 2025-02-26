import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/sizenote/view/page/size_detail_content.dart';
import 'package:app_looklog/features/sizenote/view/widget/list/category_list.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/colors.dart';
import '../controller/size_note_controller.dart';
import '../widget/list/sub_menu_detail_list.dart';

class ItemContentDetailScreen extends ConsumerStatefulWidget {
  const ItemContentDetailScreen({super.key});

  @override
  ConsumerState<ItemContentDetailScreen> createState() => _ItemContentDetailScreenState();
}

class _ItemContentDetailScreenState extends ConsumerState<ItemContentDetailScreen> {
  List<String> subTitle = ['카테고리', '브랜드', '색상'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeIndex = ref.watch(selectIndexProvider);
    final data = ref.watch(sizeNoteProvider).detailData;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            //옷 이름
            height: AppConfig.h(30),
            margin: EdgeInsets.only(left: AppConfig.w(0)),
            child: Center(child: Text(data['title'], style: Theme.of(context).textTheme.titleSmall,))
          ),
          Column(
            //카테고리,브랜드,색상
            children: subTitle.mapIndexed((index,e) {
              return SubMenuDetailList(index: index, title: e, );
            }).toList(),
          ),
          SizedBox(height: AppConfig.h(20)),
          Container(
            width: AppConfig.w(60),
            height: AppConfig.h(33),
            margin: EdgeInsets.only(right: AppConfig.w(277)),
            decoration: BoxDecoration(
                color: MAIN_COLOR,
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8)))
            ),
            child: Center(
              child: Text(data['type'], style: Theme.of(context).textTheme.labelLarge?.copyWith(color: WHITE)),
            )
          ),
          Container( //사이즈
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
            child: SizeDetailContent(),
          ),
          Row( //사이즈 후기
            children: [
              Container(
                  width: AppConfig.w(52),
                  height: AppConfig.h(30),
                  margin: EdgeInsets.only(top: AppConfig.h(25), left: AppConfig.w(25)),
                  child: Text('사이즈', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1),)),
              Container(
                width: AppConfig.w(250),
                height: AppConfig.h(30),
                margin: EdgeInsets.only(top: AppConfig.h(25), left: AppConfig.w(30)),
                child: Text(data['size'])
              )
            ],
          ),
          Row( //사이즈 후기
            children: [
              Container(
                  width: AppConfig.w(52),
                  height: AppConfig.h(30),
                  margin: EdgeInsets.only(top: AppConfig.h(10), left: AppConfig.w(25)),
                  child: Text('구매날짜', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1),)),
              Container(
                  width: AppConfig.w(250),
                  height: AppConfig.h(30),
                  margin: EdgeInsets.only(top: AppConfig.h(10), left: AppConfig.w(30)),
                  child: Text(data['date'])
              )
            ],
          ),
        ],
      ),
    );
  }
}
