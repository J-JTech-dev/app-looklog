import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/colormatching/view/controller/color_matching_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';

class ColorList extends ConsumerStatefulWidget {
  final int index;
  final String colors;
  final String name;
  final String type;
  const ColorList({super.key, required this.index, required this.colors, required this.name, required this.type});

  @override
  ConsumerState<ColorList> createState() => _ColorListState();
}

class _ColorListState extends ConsumerState<ColorList> {
  Color color = const Color(0XFF000000);

  @override
  Widget build(BuildContext context) {
    String hexColor = widget.colors.replaceAll('#', '');
    color = Color(int.parse('FF$hexColor', radix: 16));

    return SizedBox(
      height: 70,
      child: Column(
        mainAxisSize: MainAxisSize.min, // 🔹 Column이 자식 크기에 맞게 조정됨
        children: [
          GestureDetector(
            onTap: () {
              ref.read(colorMatchingProvider.notifier).selectColor(widget.name, widget.type);
              Navigator.pop(context);
            },
            child: Container(
              width: AppConfig.w(66),
              height: AppConfig.h(60),
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: GRAY_3),
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50)))
              ),
            ),
          ),
          Text(widget.name, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: BRACK_3, fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
}
