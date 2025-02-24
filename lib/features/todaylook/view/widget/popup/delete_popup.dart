import 'package:app_looklog/common/theme/colors.dart';
import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';

class DeletePopup extends StatefulWidget {
  const DeletePopup({super.key});

  @override
  State<DeletePopup> createState() => _DeletePopupState();
}

class _DeletePopupState extends State<DeletePopup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: AppConfig.h(16)),
        Text('알림', style: Theme.of(context).textTheme.titleMedium,),
        SizedBox(height: AppConfig.h(35)),
        Text('삭제하시겠습니까?', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: BRACK_3),),
        SizedBox(height: AppConfig.h(48)),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Expanded(
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
                      '아니오',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(color: BRACK_3),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: AppConfig.h(53),
                decoration: BoxDecoration(
                    color: MAIN_COLOR,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(AppConfig.r(14)),
                    )
                ),
                child: Center(
                  child: Text(
                    '삭제',
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
