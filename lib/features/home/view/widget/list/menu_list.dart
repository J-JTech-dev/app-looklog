import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../common/theme/colors.dart';
import '../../../../../main_app.dart';
import '../../controller/menu_controller.dart';


class MenuList extends ConsumerStatefulWidget {
  final int index;
  final String label;
  final String url;
  const MenuList({super.key, required this.index, required this.label, required this.url});

  @override
  ConsumerState<MenuList> createState() => _MenuListState();
}

class _MenuListState extends ConsumerState<MenuList> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.watch(menuProvider).index;

    return GestureDetector(
      onTap: (){
        ref.read(menuProvider.notifier).toggleMenu();
        ref.read(menuProvider.notifier).navigateToMenu(widget.index);
        setState(() {});
      },
      child: Padding(
        padding:  EdgeInsets.only(left: AppConfig.w(30), bottom: widget.index == 2 ? 0 : AppConfig.h(23)),
        child: SizedBox(
          height: AppConfig.h(35),
          child: Row(
            children: [
              Image.asset(widget.url, width: AppConfig.w(15),height: AppConfig.h(15),
              color: selectedIndex == widget.index ? MAIN_COLOR: GRAY_2,
              ),
              SizedBox(width: AppConfig.w(5),),
              Text(widget.label,
                style: TextStyle(
                  color: selectedIndex == widget.index ? MAIN_COLOR: GRAY_2,
                  fontSize: 16,
                  fontWeight: selectedIndex == widget.index ? FontWeight.w700: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
