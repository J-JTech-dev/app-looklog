import 'package:app_looklog/core/config/app_config.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/colors.dart';
import '../controller/size_note_controller.dart';
import '../widget/button/radio_button.dart';
import '../widget/list/category_list.dart';

class SizeDetailContent extends ConsumerStatefulWidget {
  const SizeDetailContent({super.key});

  @override
  ConsumerState<SizeDetailContent> createState() => _SizeDetailContentState();
}

class _SizeDetailContentState extends ConsumerState<SizeDetailContent> {
  List<String> sizeTop = ['총장', '어깨너비', '가슴단면', '소매길이'];
  List<String> sizeBottom = ['총장', '허리단면', '허벅지단면', '밑위', '밑단단면'];
  List<String> sizeNM = [];

  @override
  Widget build(BuildContext context) {
    sizeNM = [];
    final sizeIndex = ref.watch(selectIndexProvider);
    final data = ref.watch(sizeNoteProvider).detailData;

    sizeNM.addAll(data['type'] == '상의' ? sizeTop : sizeBottom);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sizeNM.mapIndexed((index, e) {
            return SizeTitle(
              index: index,
              title: e,
              length: sizeNM.length,
              data: data,
            );
          }).toList(),
        ),
        Column(
          //실사이즈 측정값
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data['dressInfo'].entries.map<Widget>((entry) {
            return
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: AppConfig.w(100),
                    height: AppConfig.h(30),
                    padding: EdgeInsets.only(top: AppConfig.h(9)),
                    margin: EdgeInsets.only(left: AppConfig.w(90)),
                    child: Text(
                      '${entry.value}',
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: BRACK_3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppConfig.w(50),
                    height: AppConfig.h(30),
                    child: Center(child: Text(data['unit'],style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: AppConfig.r(16)))),
                  )
                ],
              ),
            );
          }).toList(),
        ),
        Container(
          width: AppConfig.w(2),
          height: AppConfig.h(sizeIndex == 1 ?  185: 137),
          margin: EdgeInsets.only(top: AppConfig.h(20), left: AppConfig.w(110)),
          color: GRAY_5,
        ),
      ],
    );
  }
}

class SizeTitle extends ConsumerStatefulWidget {
  final int index;
  final String title;
  final int length;
  final Map<String,dynamic> data;
  const SizeTitle({super.key, required this.index, required this.title, required this.length, required this.data});

  @override
  ConsumerState<SizeTitle> createState() => _SizeTitleState();
}

class _SizeTitleState extends ConsumerState<SizeTitle> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.index == 0 ? AppConfig.h(13): 0, left: AppConfig.w(16), bottom: widget.length-1 == widget.index ? 0: AppConfig.h(10)), //right: AppConfig.w(70),
      child: Row(
        children: [
          SizedBox(
            width: AppConfig.w(70),
            height: AppConfig.h(30),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),

        ],
      ),
    );
  }
}
