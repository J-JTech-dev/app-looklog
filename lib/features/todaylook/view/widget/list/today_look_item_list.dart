import 'package:app_looklog/common/theme/colors.dart';
import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/home/view/controller/calendar_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/today_item_model.dart';

class TodayLookItemList extends ConsumerStatefulWidget {
  final int index;
  final String imgUrl;
  final String content;

  const TodayLookItemList({super.key, required this.index, required this.imgUrl, required this.content});

  @override
  ConsumerState<TodayLookItemList> createState() => _TodayLookItemListState();
}

class _TodayLookItemListState extends ConsumerState<TodayLookItemList> {
  @override
  Widget build(BuildContext context) {
    final selectedDay = ref.watch(calendarProvider.notifier).getSelectedDay();

    return GestureDetector(
      onTap: () {
        context.go('/insert/:$selectedDay',extra: TodayItemModel(imageUrl: widget.imgUrl, content: widget.content));
      },
      child: Container(
        decoration: BoxDecoration(
          color: WHITE,
          borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8))),
          border: Border.all(color: GRAY_3),
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
                height: AppConfig.h(150),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8))),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConfig.r(8)), topRight: Radius.circular(AppConfig.r(8))),
                    child: Image.asset(widget.imgUrl, fit: BoxFit.cover,)),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: AppConfig.h(10), horizontal: AppConfig.w(10)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(widget.content, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: BRACK_2,
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
