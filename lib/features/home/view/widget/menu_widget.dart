import 'package:app_looklog/features/home/view/controller/menu_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/config/app_config.dart';


class MenuWidget extends ConsumerStatefulWidget {
  const MenuWidget({super.key});

  @override
  ConsumerState<MenuWidget> createState() => _MenuWidgetState();
}


class _MenuWidgetState extends ConsumerState<MenuWidget> {

  @override
  Widget build(BuildContext context) {
    final openYn = ref.watch(menuProvider).isOpen;
    print('openYn $openYn');

    return Stack(
      alignment: Alignment.centerLeft,
      // fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            ref.read(menuProvider.notifier).toggleMenu();
            print('상태변경');
            setState(() {});
          },
          child: Visibility(
            visible: openYn,
            child: Container(
              width: openYn == false ? 0 : double.infinity,
              height: openYn == false ? 0 : double.infinity,
              color: BRACK_1.withOpacity(AppConfig.r(.3))
            ),
          ),
        ),
        AnimatedSize(
          duration: Duration(milliseconds: openYn == false ? 100 : 200),
          alignment: Alignment.center,
          curve: Curves.easeInOutQuad,
          child: Container(
            width: openYn == false ? 0 : AppConfig.w(250),
            decoration: BoxDecoration(
              color: Colors.yellow,
              boxShadow: [
                BoxShadow(
                  color: GRAY_3.withOpacity(AppConfig.r(.25)),
                  blurRadius: AppConfig.r(4),
                  offset: Offset(AppConfig.r(3),0), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   mainAxisSize: MainAxisSize.min,
                //   children: widget.menuDatas
                //       .mapIndexed((index, element) {
                //     return MenuItem(
                //       label: element.title,
                //       depth: 0,
                //       index: index,
                //       selectedIndex: ref
                //           .watch(selectOneDepthIndexProvider),
                //       itemClick: itemClick,
                //       data: element,
                //     );
                //   }).toList(),
                // ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(menuProvider.notifier).toggleMenu();
            //     print("클릭");
          },
          child: Padding(
            padding: EdgeInsets.only(left: AppConfig.w(23), bottom: AppConfig.h(700)),
            child: Visibility(
              visible: openYn == false ? true: false,
              child: SizedBox(
                width: AppConfig.w(23),
                height: AppConfig.h(20),
                child: Image.asset('assets/icons/menu_icon.png'),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
