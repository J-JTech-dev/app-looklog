import 'package:flutter/material.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../core/config/app_config.dart';
import '../textField/insert_textfield_widget.dart';

class InsertPopup extends StatefulWidget {
  final String title;
  const InsertPopup({super.key, required this.title});

  @override
  State<InsertPopup> createState() => _InsertPopupState();
}

class _InsertPopupState extends State<InsertPopup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppConfig.h(50)),
        Text('${widget.title} 등록',style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: AppConfig.h(31)),
        Container(
          width: AppConfig.w(256),
          height: AppConfig.h(34),
          padding: EdgeInsets.only(left: AppConfig.w(10)),
          decoration: BoxDecoration(
            color: WHITE_1,
            border: Border.all(color: GRAY_6),
            borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(5)))
          ),
          child: const InsertTextFieldWidget()
        ),
        const SizedBox(height: 38),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: AppConfig.h(53),
                  decoration: BoxDecoration(
                      color: SUB_COLOR_3,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(AppConfig.r(14)),
                      )
                  ),
                  child: Center(
                    child: Text(
                      '취소',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: BRACK_3),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: AppConfig.w(156),
                height: AppConfig.h(53),
                decoration: BoxDecoration(
                  color: MAIN_COLOR,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppConfig.r(14)),
                  )
                ),
                child: Center(
                  child: Text(
                    '등록',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: WHITE),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
