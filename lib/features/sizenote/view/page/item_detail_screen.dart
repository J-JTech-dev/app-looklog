import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/config/app_config.dart';
import '../../../todaylook/view/widget/popup/delete_popup.dart';
import '../controller/size_note_controller.dart';
import 'item_content_detail_screen.dart';

class ItemDetailScreen extends ConsumerStatefulWidget {
  const ItemDetailScreen({super.key});

  @override
  ConsumerState<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends ConsumerState<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(sizeNoteProvider).detailData;

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
                              SizedBox(width: AppConfig.w(20)),
                              GestureDetector(
                                  onTap: () {
                                    context.go('/item/insert/:edit');
                                  },
                                  child: Image.asset('assets/icons/edit_icon.png',width: AppConfig.w(23),height: AppConfig.h(23),)),
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
                        child: ItemContentDetailScreen(),
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
                  child: data['img'] != '' ?
                  Image.asset(data['img']):
                      Image.asset('assets/images/no_img.png', fit: BoxFit.cover,)
                  ,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: AppConfig.h(190), right: AppConfig.w(20)),
                      child: Image.asset(
                        data['check'] == true ?
                        'assets/icons/star_icon.png' :
                        'assets/icons/empty_star_icon.png', width: AppConfig.w(25), height: AppConfig.h(25),),
                    )),
              ],
            ),
          ),
        )
    );
  }
}
