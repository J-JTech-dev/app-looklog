import 'package:app_looklog/features/home/view/controller/menu_controller.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/colors.dart';
import '../../../../core/config/app_config.dart';
import '../list/menu_list.dart';


class MenuWidget extends ConsumerStatefulWidget {
  const MenuWidget({super.key});

  @override
  ConsumerState<MenuWidget> createState() => _MenuWidgetState();
}


class _MenuWidgetState extends ConsumerState<MenuWidget> {

  @override
  Widget build(BuildContext context) {
    final openYn = ref.watch(menuProvider).isOpen;

    return Stack(
      alignment: Alignment.centerLeft,
      // fit: StackFit.expand,
      children: [
        GestureDetector(
          onTap: () {
            ref.read(menuProvider.notifier).toggleMenu();
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
              color: WHITE,
              boxShadow: [
                BoxShadow(
                  color: GRAY_3.withOpacity(AppConfig.r(.25)),
                  blurRadius: AppConfig.r(4),
                  offset: Offset(AppConfig.r(3),0), // changes position of shadow
                ),
              ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: AppConfig.h(103), left: AppConfig.w(56)),
                  child: Column(
                    children: [
                      Container(
                        width: AppConfig.w(40),
                        height: AppConfig.h(43),
                        padding:EdgeInsets.only(top: AppConfig.h(5)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(50))),
                          color: GRAY_7,
                          border: Border.all(color: GRAY_3)
                        ),
                        child: Image.asset('assets/images/person_img.png'),
                      ),
                      SizedBox(height: AppConfig.w(13),),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '홍길동',
                              style: const TextStyle(
                                color: BRACK_2,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: '님',
                              style: const TextStyle(
                                color: BRACK_2,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: AppConfig.h(259)),
                  child: Column(
                    children: AppConfig.menuItems
                        .mapIndexed((index, element) {
                      return MenuList(
                        index: index,
                        label: element['name']!,
                        url: element['url']!,
                        // itemClick: itemClick,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            ref.read(menuProvider.notifier).toggleMenu();
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
