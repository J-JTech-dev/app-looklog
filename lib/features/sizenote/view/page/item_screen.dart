import 'package:app_looklog/features/sizenote/data/datasources/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/config/app_config.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap:() {
            context.go('/');
          },
          child: Image.asset('assets/icons/left_arrow_icon.png', width: AppConfig.w(25),height: AppConfig.h(25),),
        ),
        Container(
          width: AppConfig.w(343),
          height: AppConfig.h(43),
          decoration: BoxDecoration(
            color: GRAY_10,
            border: Border.all(color: GRAY_4),
            borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(20)))
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: BRACK_2,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                      hintText: '아이템을 검색해보세요.',
                      hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: GRAY_6,
                        fontWeight: FontWeight.w500,
                      ),
                      border: InputBorder.none
                  ),
                ),
              ),
              Container(
                width: AppConfig.w(25),
                height: AppConfig.h(25),
                child: Image.asset('assets/icons/search_icon.png'),
              )
            ],
          ),
        ),
        Container(),
        // Column(
        //   children: DummyData.itemList.mapIndexed((index, element) {
        //     return ;
        //   }).toList,
        // )
      ],
    );
  }
}
