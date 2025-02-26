import 'package:app_looklog/core/config/app_config.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/colors.dart';
import '../widget/button/radio_button.dart';
import '../widget/list/category_list.dart';

class SizeContent extends ConsumerStatefulWidget {
  const SizeContent({super.key});

  @override
  ConsumerState<SizeContent> createState() => _SizeContentState();
}

class _SizeContentState extends ConsumerState<SizeContent> {
  List<String> sizeTop = ['총장', '어깨너비', '가슴단면', '소매길이'];
  List<String> sizeBottom = ['총장', '허리단면', '허벅지단면', '밑위', '밑단단면'];
  List<String> size = [];

  @override
  Widget build(BuildContext context) {
    size = [];
    final sizeIndex = ref.watch(selectIndexProvider);
    size.addAll(sizeIndex == 0? sizeTop : sizeBottom);

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: size.mapIndexed((index, e) {
            return SizeTitle(
              index: index,
              title: e,
              length: size.length,
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
  const SizeTitle({super.key, required this.index, required this.title, required this.length});

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
    final unit = ref.watch(selectUnitProvider);

    return Padding(
      padding: EdgeInsets.only(top: widget.index == 0 ? AppConfig.h(13): 0, left: AppConfig.w(16), bottom: widget.length-1 == widget.index ? 0: AppConfig.h(10)), //right: AppConfig.w(70),
      child: Row(
        children: [
          SizedBox(
            width: AppConfig.w(70),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: AppConfig.w(100),
                  height: AppConfig.h(30),
                  margin: EdgeInsets.only(left: AppConfig.w(90)),
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: BRACK_2,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                        hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: GRAY_3,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  width: AppConfig.w(50),
                  height: AppConfig.h(30),
                  child: Center(child: Text(unit == 0 ? 'cm' : 'inch', style: Theme.of(context).textTheme.titleSmall)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
