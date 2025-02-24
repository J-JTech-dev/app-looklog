import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';

final selectUnitProvider = StateProvider<int>((ref) => 0); //단위 선택

class RadioButton extends ConsumerStatefulWidget {
  final int index;
  final String value;
  const RadioButton({super.key,required this.index, required this.value});

  @override
  ConsumerState<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends ConsumerState<RadioButton> {

  @override
  Widget build(BuildContext context) {
    final unitIndex = ref.watch(selectUnitProvider);

    return GestureDetector(
      onTap: () {
        ref.read(selectUnitProvider.notifier).state = widget.index;
      },
      child: SizedBox(
        height: AppConfig.h(40),
        child: Row(
          children: [
            Container(
              width: AppConfig.w(14),
              height: AppConfig.h(13),
              padding: EdgeInsets.all(AppConfig.r(1)),
              decoration: BoxDecoration(
                border: Border.all(color: GRAY_8),
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50)))
              ),
              child: Container(
                width: AppConfig.w(7),
                height: AppConfig.h(7),
                decoration: BoxDecoration(
                    color: unitIndex == widget.index ? MAIN_COLOR : WHITE,
                    borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50)))
                ),
              )
            ),
            SizedBox(width: AppConfig.w(5)),
            Text(widget.value, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: BRACK_3),),
          ],
        ),
      ),
    );
  }
}
