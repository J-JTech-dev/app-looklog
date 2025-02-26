import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/colormatching/view/controller/color_matching_controller.dart';
import 'package:app_looklog/features/colormatching/view/widget/popup/bottom_modal_popup.dart';
import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/theme/colors.dart';

class DressImageScreen extends ConsumerStatefulWidget {
  const DressImageScreen({super.key});

  @override
  ConsumerState<DressImageScreen> createState() => _DressImageScreenState();
}

class _DressImageScreenState extends ConsumerState<DressImageScreen> {
  bool topCheck = false;
  bool bottomCheck = false;
  bool shoesCheck = false;
  bool errorAlert = false; //2개까지만 선택가능에러
  bool clickErrorAlert = false; //버튼 클릭 에러
  bool clickAble = false; //버튼 클릭가능한지

  void _handleSelection(bool isSelected, Function updateState) {
    if (!isSelected && [topCheck, bottomCheck, shoesCheck].where((e) => e).length >= 2) {
      // 2개 이상 선택되었으면 알럿 표시
      errorAlert = true;
      setState(() {});

      Future.delayed(const Duration(seconds: 1), () {
        errorAlert = false;
        setState(() {});
      });

    } else {
      // 선택 처리
      setState(() {
        updateState();

        int selectedCount = [topCheck, bottomCheck, shoesCheck].where((e) => e).length;
        clickAble = selectedCount > 0;
      });
    }
  }

  Future<void> showBottomModal(String type) {
    //컬러선택 팝업창
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppConfig.r(30)),
              topRight: Radius.circular(AppConfig.r(30)),
            )
        ),
        builder: (BuildContext context) {
          return Container(
            height: 500,
            color: Colors.transparent,
            child: BottomModalPopup(type: type,)
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    final topColor = (ref.watch(colorMatchingProvider).topColor?.isNotEmpty ?? false)
        ? ref.watch(colorMatchingProvider).topColor
        : "black";
    final bottomColor = (ref.watch(colorMatchingProvider).bottomColor?.isNotEmpty ?? false)
        ? ref.watch(colorMatchingProvider).bottomColor
        : "black";
    final shoesColor = (ref.watch(colorMatchingProvider).shoesColor?.isNotEmpty ?? false)
        ? ref.watch(colorMatchingProvider).shoesColor
        : "black";

    return Column(
      children: [
        SizedBox(height: AppConfig.h(130)),
        Visibility(
            visible: errorAlert,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Text('최대 2개까지만 선택이 가능합니다.',style: Theme.of(context).textTheme.labelSmall?.copyWith(color: RED_1, fontSize: 16))),
        SizedBox(height: AppConfig.h(10)),
        Container(
          width: AppConfig.sizeW,
          height: AppConfig.h(340),
          decoration: const BoxDecoration(
              color: GRAY_13,
            border: Border(
              top: BorderSide(color: GRAY_7, width: 2),
              bottom: BorderSide(color: GRAY_7, width: 2)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    showBottomModal('상의');
                  },
                  onLongPress: () {
                    Vibration.vibrate(duration: 50);
                    _handleSelection(topCheck, () => topCheck = !topCheck);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/top/${topColor}_top.png', width: AppConfig.w(110), height: AppConfig.h(110),),
                      if (topCheck)
                        Image.asset('assets/images/check_img.png', width: AppConfig.w(24), height: AppConfig.h(24),),
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    showBottomModal('하의');
                  },
                  onLongPress: () {
                    Vibration.vibrate(duration: 50);
                    _handleSelection(bottomCheck, () => bottomCheck = !bottomCheck);
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/bottom/${bottomColor}_bottom.png', width: AppConfig.w(168), height: AppConfig.h(150),),
                      if (bottomCheck)
                        Padding(
                          padding: EdgeInsets.only(left: AppConfig.w(50)),
                          child: Image.asset('assets/images/check_img.png', width: AppConfig.w(24), height: AppConfig.h(24),),
                        ),
                    ],
                  )),
              GestureDetector(
                  onTap: () {
                    showBottomModal('신발');
                  },
                  onLongPress: () {
                    Vibration.vibrate(duration: 50);
                    _handleSelection(shoesCheck, () => shoesCheck = !shoesCheck);
                  },
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Image.asset('assets/images/shoes/${shoesColor}_shoes.png', width: AppConfig.w(128), height: AppConfig.h(60),),
                      if (shoesCheck)
                        Image.asset('assets/images/check_img.png', width: AppConfig.w(24), height: AppConfig.h(24),),
                    ],
                  )),
            ],
          ),
        ),
        Visibility(
          visible: clickErrorAlert,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Container(//색조합 버튼
              width: AppConfig.w(333),
              margin: EdgeInsets.only(top: AppConfig.h(42), bottom: AppConfig.h(8)),
              child: Text('상의/하의를 길게 선택하여 색조합을 추천받아보세요.', textAlign: TextAlign.start,style: Theme.of(context).textTheme.labelSmall?.copyWith(color: RED_1),)),
        ),
        GestureDetector(
          onTap: () {
            if ([topCheck, bottomCheck, shoesCheck].where((e) => e).isEmpty) {
              clickErrorAlert = true;
              setState(() {});

              Future.delayed(const Duration(seconds: 1), () {
                clickErrorAlert = false;
                setState(() {});
              });
            }
          },
          child: Container(
            width: AppConfig.w(333),
            height: AppConfig.h(50),
            decoration: BoxDecoration(
                color: clickAble ? MAIN_COLOR : GRAY_3,
                borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(10)))
            ),
            child: Center(
              child: Text('색조합 추천', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: clickAble ? WHITE : BRACK_2),),
            ),
          ),
        ),
      ],
    );
  }
}
