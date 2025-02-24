import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/sizenote/view/widget/popup/insert_popup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/theme/colors.dart';
import '../../../data/datasources/dummy_data.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({super.key});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin{
  List<String> tabNames = ["카테고리", "브랜드", "색상"];

  late TabController tabController = TabController(length: 3, vsync: this, initialIndex: 0);

  @override
  void initState() {
    super.initState();
    tabController.addListener(() {
      setState(() {}); // 탭 변경될 때 UI 업데이트
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:  BoxDecoration(
            border: Border(bottom: BorderSide(color: GRAY_5, width: AppConfig.w(1.0)))
          ),
          child: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: '카테고리'),
              Tab(text: '브랜드'),
              Tab(text: '색상'),
            ],
            labelColor: MAIN_COLOR,
            labelStyle: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            unselectedLabelColor: BRACK_1,
            unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
            indicatorColor: MAIN_COLOR,
            indicatorWeight: 3,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: AppConfig.h(20), left: AppConfig.w(38), right: AppConfig.w(38)),
            child: TabBarView(
              controller: tabController,
              children: [
                buildGridView(DummyData.category),
                buildGridView(DummyData.brand),
                buildGridView(DummyData.colors),
              ]
                    ),
          ),)
      ],
    );
  }

  Widget buildGridView(List<Map<String, dynamic>> data) {
    return GridView.builder(
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 32,
        mainAxisSpacing: 46,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (data[index]['title'] == null) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      AlertDialog(
                          insetPadding: EdgeInsets.zero, // 마진 제거
                          contentPadding: EdgeInsets.zero, // 기본 패딩 제거
                          clipBehavior: Clip.antiAlias, // 디자인 깔끔하게
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConfig.r(14))), // 모서리 둥글게
                          content:  InsertPopup(title: tabController.index == 0 ? '카테고리' : tabController.index == 1 ? '브랜드' : '색상',),
                      ),
                      Container(
                        width: AppConfig.w(70),
                        height: AppConfig.h(63),
                        margin: EdgeInsets.only(bottom: AppConfig.h(220)),
                        padding: EdgeInsets.all(AppConfig.r(8)),
                        decoration: BoxDecoration(
                            color: WHITE_1,
                            borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50)))
                        ),
                        child: Image.asset('assets/icons/insert_popup_icon.png'),
                      ),
                    ],
                  );
                },
              );
            }
            else {
              context.go('/item');
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: data[index]['title'] == null  ? GRAY_4 : WHITE,
              boxShadow: [
                BoxShadow(
                  blurRadius: data[index]['title'] == null ? 0: AppConfig.r(7),
                  offset: const Offset(0,0),
                  color: BRACK_2.withOpacity(AppConfig.r(0.13))
                )
              ],
              borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8)))
            ),
            child: data[index]['title'] == null  ?
            Center(
              child: Image.asset('assets/icons/size_plus_icon.png',width: AppConfig.w(50),height: AppConfig.h(50),),
            ):
            Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: AppConfig.h(32),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(AppConfig.r(8)),
                              topRight: Radius.circular(AppConfig.r(8)),
                            ),
                            color: MAIN_COLOR,
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.only(top: AppConfig.h(10),right: AppConfig.w(10)),
                              child: Image.asset('assets/icons/right_arrow_icon.png', width: AppConfig.w(6),height: AppConfig.h(9),),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: AppConfig.h(10),left: AppConfig.w(10)),
                      child: Text('${data[index]['title']}', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: BRACK_1, fontSize: AppConfig.r(15))),
                    ),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: AppConfig.w(10), bottom: AppConfig.h(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: AppConfig.w(4),
                            height: AppConfig.h(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50))),
                              color: SUB_COLOR_1,
                            ),
                          ),
                          SizedBox(width: AppConfig.w(6)),
                          Text('${data[index]['count']}', style: Theme.of(context).textTheme.bodySmall?.copyWith(color: BRACK_1),),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
