import 'package:app_looklog/features/sizenote/view/widget/textField/search_textfield_widget.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/config/app_config.dart';
import '../widget/button/search_button.dart';

final searchFilterIndexProvider = StateProvider<int>((ref) => 0); //검색필터

class ItemScreen extends ConsumerStatefulWidget {
  const ItemScreen({super.key});

  @override
  ConsumerState<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends ConsumerState<ItemScreen> {
  List<String> btnText = ['전체보기', '즐겨찾기'];

  @override
  Widget build(BuildContext context) {
    final searchIndex = ref.watch(searchFilterIndexProvider);

    return Padding(
      padding: EdgeInsets.only(top: AppConfig.h(68), left: AppConfig.w(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap:() {
              context.go('/');
            },
            child: Image.asset('assets/icons/left_arrow_icon.png', width: AppConfig.w(25),height: AppConfig.h(25),),
          ),
          SizedBox(height: AppConfig.h(19)),
          Container(
            width: AppConfig.w(343),
            height: AppConfig.h(50),
            padding: EdgeInsets.symmetric(horizontal: AppConfig.w(16)),
            decoration: BoxDecoration(
              color: GRAY_10,
              border: Border.all(color: GRAY_4),
              borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(20)))
            ),
            child: Row(
              children: [
                const Expanded(
                  child: SearchTextFieldWidget()
                ),
                SizedBox(
                  width: AppConfig.w(25),
                  height: AppConfig.h(25),
                  child: Image.asset('assets/icons/search_icon.png'),
                )
              ],
            ),
          ),
          Container(
            width: AppConfig.w(287),
            height: AppConfig.h(60),
            margin: EdgeInsets.only(top: AppConfig.h(31), left: AppConfig.w(30), right: AppConfig.w(30),),
            decoration: BoxDecoration(
              color: MAIN_COLOR,
              borderRadius: BorderRadius.all(
                Radius.circular(AppConfig.r(10))
              )
            ),
            child: Row(
              children: btnText.mapIndexed((index, element) {
                return Expanded(child: SearchButton(
                    index: index,
                    text: element,
                  ));
                }).toList()
            ),
          ),
          // Column(
          //   children: DummyData.itemList.mapIndexed((index, element) {
          //     return ;
          //   }).toList,
          // )
        ],
      ),
    );
  }
}
