import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/sizenote/view/controller/size_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/theme/colors.dart';

class ItemList extends ConsumerStatefulWidget {
  final int index;
  final String title;
  final String brand;
  final String size;
  final String date;
  final String imgUrl;
  final bool check;
  final Map<String,dynamic> data;
  const ItemList({super.key,required this.index, required this.title, required this.brand, required this.size, required this.date, required this.imgUrl, required this.check, required this.data});

  @override
  ConsumerState<ItemList> createState() => _ItemListState();
}

class _ItemListState extends ConsumerState<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          onTap: () {
            print('데이터 확인 ${widget.data}');
            ref.read(sizeNoteProvider.notifier).detailData(widget.data);
            context.go('/item/detail');

          },
          child: Container(
            width: AppConfig.w(343),
            height: AppConfig.h(139),
            margin: EdgeInsets.only(top: widget.index == 0 ? AppConfig.h(23) : 0, bottom: AppConfig.h(23)),
            decoration: BoxDecoration(
                color: WHITE,
              borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8))),
              boxShadow: [
                BoxShadow(
                  blurRadius: AppConfig.r(7),
                  offset: const Offset(0,0),
                  color: BRACK_2.withOpacity(AppConfig.r(0.13))
                )
              ],
            ),
            child: Row(
              children: [
                Container(
                  //이미지
                  width: AppConfig.w(130),
                  height: AppConfig.h(115),
                  margin: EdgeInsets.only(left: AppConfig.w(12)),
                  decoration: BoxDecoration(
                    color: GRAY_3,
                    borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(8))),
                  ),
                  child: widget.imgUrl != ''?
                  Image.asset(widget.imgUrl, fit: BoxFit.contain,):
                  Image.asset('assets/images/no_img.png', fit: BoxFit.contain,),
                ),
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: AppConfig.w(18)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: AppConfig.w(170),
                                margin: EdgeInsets.only(top: AppConfig.h(13)),
                                child: Text(widget.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: AppConfig.r(16)),)),
                            Container(
                                width: AppConfig.w(162),
                                margin: EdgeInsets.only(top: AppConfig.h(10), bottom: AppConfig.h(57)),
                                child: Text(widget.brand,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: BRACK_2),)),
                            Padding(
                              padding: EdgeInsets.only(right: AppConfig.w(12)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(widget.size, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: BRACK_2, fontSize: AppConfig.r(13)),),
                                  Text(widget.date, style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: AppConfig.r(13)),),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: AppConfig.w(18)),
                        child: Image.asset('assets/icons/right_arrow_color_icon.png', width: AppConfig.w(7),height: AppConfig.h(11),),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (widget.check)
        Padding(
          padding: EdgeInsets.only(top: widget.index == 0 ? AppConfig.h(23) : 0),
          child: Image.asset('assets/icons/star_icon.png', width: AppConfig.w(22),height: AppConfig.h(22),),
        ),
      ],
    );
  }
}
