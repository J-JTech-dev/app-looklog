import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/colors.dart';
import '../../../todaylook/view/widget/popup/delete_popup.dart';
import '../controller/size_note_controller.dart';
import 'item_content_screen.dart';

class ItemInsertScreen extends ConsumerStatefulWidget {
  final String type;
  const ItemInsertScreen({super.key, required this.type});

  @override
  ConsumerState<ItemInsertScreen> createState() => _ItemInsertScreenState();
}

class _ItemInsertScreenState extends ConsumerState<ItemInsertScreen> {
  @override
  Widget build(BuildContext context) {
    final checkYn = ref.watch(sizeNoteProvider).check;

    return Scaffold(
        body: Padding(
        padding:  EdgeInsets.only(top: AppConfig.h(40)),
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: AppConfig.h(23),left: AppConfig.w(16), right: AppConfig.w(23)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:() {
                            context.go('/item');
                          },
                          child: SizedBox(
                              width: AppConfig.w(30),
                              child: Image.asset('assets/icons/left_arrow_icon.png', width: AppConfig.w(12),height: AppConfig.h(20),)),
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          contentPadding: EdgeInsets.zero, // 기본 패딩 제거
                                          content: SizedBox(
                                              width: AppConfig.w(314),
                                              child: const DeletePopup()
                                          )
                                      );
                                    },
                                  );
                                },
                                child: Image.asset('assets/icons/trash_icon.png', width: AppConfig.w(30),height: AppConfig.h(30),)),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: AppConfig.sizeW,
                    height: AppConfig.h(623),
                    margin: EdgeInsets.only(top: AppConfig.h(119)),
                    decoration: BoxDecoration(
                        color: WHITE,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: AppConfig.r(10),
                            color: GRAY_3.withOpacity(AppConfig.r(0.25)),
                            offset: const Offset(0, 0),
                          )
                        ],
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConfig.r(20)), topRight: Radius.circular(AppConfig.r(20)),)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(top: AppConfig.h(50)),
                      child: ItemContentScreen(),
                    ),
                  )
                ],
              ),
              Container(
                //아이템 사진
                width: AppConfig.w(147),
                height: AppConfig.h(147),
                margin: EdgeInsets.only(top: AppConfig.h(75)),
                decoration: BoxDecoration(
                  color: WHITE,
                  border: Border.all(color: GRAY_3),
                  borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: AppConfig.w(10), bottom: AppConfig.h(10)),
                      child: Image.asset('assets/images/edit_img.png', width: AppConfig.w(30),height: AppConfig.h(30),),
                    )
                  ],
                ),
              ),
              GestureDetector(
                //아이템 즐겨찾기
                onTap: () {
                  ref.read(sizeNoteProvider.notifier).toggleCheck();
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppConfig.h(190), right: AppConfig.w(20)),
                      child: Image.asset(
                        checkYn ?
                        'assets/icons/star_icon.png' :
                        'assets/icons/empty_star_icon.png', width: AppConfig.w(25), height: AppConfig.h(25),),
                    )),
              )
            ],
          ),
        ),
      )
    );
  }
}
