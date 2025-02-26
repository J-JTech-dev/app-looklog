import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/sizenote/view/controller/size_note_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';

class SubMenuDetailList extends ConsumerStatefulWidget {
  final int index;
  final String title;
  const SubMenuDetailList({super.key, required this.index, required this.title});

  @override
  ConsumerState<SubMenuDetailList> createState() => _SubMenuDetailListState();
}

class _SubMenuDetailListState extends ConsumerState<SubMenuDetailList> {
  @override
  Widget build(BuildContext context) {
    final data = ref.watch(sizeNoteProvider).detailData;

    return Padding(
      padding: EdgeInsets.only(top: AppConfig.h(25), left: AppConfig.w(25), right: AppConfig.w(25)),
      child: Row(
        children: [
          SizedBox(
              width: AppConfig.w(52),
              height: AppConfig.h(30),
              child: Text(widget.title, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1),)),
          SizedBox(width: AppConfig.w(25)),
          Expanded(
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
              child: Text(widget.index == 0 ? data['category'] : widget.index == 1 ? data['brand'] : data['color'], style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1, fontWeight: FontWeight.w400),),
            ),
          ),
        ],
      ),
    );
  }
}
