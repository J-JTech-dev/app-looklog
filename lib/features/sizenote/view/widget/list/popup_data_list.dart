import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';
import '../../controller/size_note_controller.dart';

class PopupDataList extends ConsumerStatefulWidget {
  final int index;
  final String data;
  final String type;
  const PopupDataList({super.key, required this.index, required this.data, required this.type});

  @override
  ConsumerState<PopupDataList> createState() => _PopupDataListState();
}

class _PopupDataListState extends ConsumerState<PopupDataList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ref.read(sizeNoteProvider.notifier).selectData(widget.data, widget.type);
        Navigator.pop(context);
      },
      child: Container(
        width: AppConfig.w(276),
        height: AppConfig.h(40),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: GRAY_7,
              width: AppConfig.w(2),
            )
          )
        ),
        padding: EdgeInsets.symmetric(vertical: AppConfig.h(8), horizontal: AppConfig.w(8)),
        child: Text(widget.data, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: BRACK_2, fontWeight: FontWeight.w700),),
      ),
    );
  }
}
