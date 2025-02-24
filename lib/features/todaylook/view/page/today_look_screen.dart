import 'package:app_looklog/features/todaylook/view/widget/list/today_look_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/config/app_config.dart';
import '../../../../core/utils/calendar_utils.dart';
import '../../../home/view/controller/calendar_controller.dart';
import '../../../home/view/widget/calendar/calendar_widget.dart';
import '../../data/models/today_item_model.dart';

class TodayLookScreen extends ConsumerStatefulWidget {
  const TodayLookScreen({super.key});

  @override
  ConsumerState<TodayLookScreen> createState() => _TodayLookScreenState();
}

class _TodayLookScreenState extends ConsumerState<TodayLookScreen> {
  String today = '';

  @override
  void initState() {
    super.initState();
    today = DateFormat('yyyy년 MM월 dd일').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final calendarState = ref.watch(calendarProvider);
    final events = calendarState.selectedEvents; // ValueNotifier에서 값 꺼내기

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: AppConfig.h(80), left: AppConfig.w(10), right: AppConfig.w(10)),
                child: const CalendarWidget(rowHeight: 46.0),
              ),
              Container(
                width: AppConfig.w(336),
                height: AppConfig.h(2),
                margin: EdgeInsets.only(top: AppConfig.h(30), bottom: AppConfig.h(20)),
                color: GRAY_3,
              ),
              Expanded(
                child: SizedBox(
                  width: AppConfig.w(336),
                  child: ValueListenableBuilder<List<Event>>(
                      valueListenable: events,
                      builder: (context, value, _) {
                        return GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 20,
                            childAspectRatio: 2 / 2.6, // (가로:세로) 비율 설정
                          ),
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return TodayLookItemList(
                              index: index,
                              imgUrl: value[index].imgUrl,
                              content: value[index].content,
                              // itemClick: itemClick,
                            );
                          },
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            //오늘의 옷 추가 버튼
            onTap: () {
              context.go('/insert:$today',extra: TodayItemModel(imageUrl: '', content: ''));
            },
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: AppConfig.w(60),
                height: AppConfig.h(54),
                margin: EdgeInsets.only(right: AppConfig.w(30), bottom: AppConfig.h(30)),
                decoration: BoxDecoration(
                  color: MAIN_COLOR,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: AppConfig.r(5),
                      color: MAIN_COLOR.withOpacity(AppConfig.r(0.25)),
                      offset: Offset(0, AppConfig.h(2)),
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50)))
                ),
                padding: EdgeInsets.all(AppConfig.w(10)),
                child: Image.asset('assets/icons/plus_icon.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
