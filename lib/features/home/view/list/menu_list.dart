import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';

import '../../../../common/theme/colors.dart';

class MenuList extends StatefulWidget {
  final int index;
  final String label;
  final String url;
  const MenuList({super.key, required this.index, required this.label, required this.url});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: AppConfig.w(30), bottom: widget.index == 2 ? 0 : AppConfig.h(23)),
      child: Row(
        children: [
          Image.asset(widget.url, width: AppConfig.w(15),height: AppConfig.h(15),),
          SizedBox(width: AppConfig.w(5),),
          Text(widget.label,
            style: const TextStyle(
              color: GRAY_2,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
