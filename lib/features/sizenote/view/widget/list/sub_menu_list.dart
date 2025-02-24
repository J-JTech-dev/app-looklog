import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/theme/colors.dart';

class SubMenuList extends StatefulWidget {
  final int index;
  final String title;
  const SubMenuList({super.key, required this.index, required this.title});

  @override
  State<SubMenuList> createState() => _SubMenuListState();
}

class _SubMenuListState extends State<SubMenuList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConfig.h(25), left: AppConfig.w(25), right: AppConfig.w(25)),
      child: Row(
        children: [
          SizedBox(
              width: AppConfig.w(52),
              child: Text(widget.title, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1),)),
          SizedBox(width: AppConfig.w(25)),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('상의', style: Theme.of(context).textTheme.labelLarge?.copyWith(color: BRACK_1, fontWeight: FontWeight.w400),),
                Image.asset('assets/icons/right_arrow_color_icon.png', width: AppConfig.w(7), height: AppConfig.h(11),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
