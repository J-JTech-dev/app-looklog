import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/sizenote/view/controller/size_note_controller.dart';
import 'package:app_looklog/features/sizenote/view/widget/popup/sub_select_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';

class SubMenuList extends ConsumerStatefulWidget {
  final int index;
  final String title;
  const SubMenuList({super.key, required this.index, required this.title});

  @override
  ConsumerState<SubMenuList> createState() => _SubMenuListState();
}

class _SubMenuListState extends ConsumerState<SubMenuList> {
  @override
  Widget build(BuildContext context) {
    final selectedCategory = ref.watch(sizeNoteProvider).category;
    final selectedBrand = ref.watch(sizeNoteProvider).brand;
    final selectedColor = ref.watch(sizeNoteProvider).color;

    return Padding(
      padding: EdgeInsets.only(top: AppConfig.h(25), left: AppConfig.w(25), right: AppConfig.w(25)),
      child: Row(
        children: [
          SizedBox(
              width: AppConfig.w(52),
              child: Text(widget.title, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1),)),
          SizedBox(width: AppConfig.w(25)),
          Expanded(
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      insetPadding: EdgeInsets.zero,
                      contentPadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConfig.r(15))), // 모서리 둥글게
                      content:  SizedBox(
                          width: 337,
                          height: 271,
                          child: SubSelectPopup(title: widget.title,)),
                    );
                  },
                );
              },
              child: Container(
                height: AppConfig.h(30),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: GRAY_3,
                      width: 2,
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.index == 0 ? selectedCategory : widget.index == 1 ? selectedBrand : selectedColor, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1, fontWeight: FontWeight.w400),),
                    Image.asset('assets/icons/right_arrow_color_icon.png', width: AppConfig.w(7), height: AppConfig.h(11),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
