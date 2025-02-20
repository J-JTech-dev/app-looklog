import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuState {
  final bool isOpen;
  final int index;
  final bool screenInit;

  MenuState({
    required this.isOpen,
    required this.index,
    required this.screenInit,
  });
  
  MenuState copyWith({
    bool? isOpen,
    int? index,
    bool? screenInit,
  }) {
    return MenuState(isOpen: isOpen ?? this.isOpen, index: index ?? this.index, screenInit: screenInit ?? this.screenInit);
  }
}

class MenuController extends StateNotifier<MenuState> {
  MenuController() : super(MenuState(isOpen: false, index: -1, screenInit: false),);

  bool get openYn => state.isOpen;  // isOpen 값을 가져오는 getter
  bool get screenInit => state.screenInit; //메뉴화면으로 이동했는지 여부
  int get menuIndex => state.index; //메뉴 인덱스 값 가져오는 getter

  // 상태를 변경하는 메서드
  void toggleMenu() {
    state = state.copyWith(isOpen: !state.isOpen); // 상태를 반전시킴
  }

  void navigateToMenu(int selectedIndex) {
    state = state.copyWith(index: selectedIndex, screenInit: false);
  }

  void screenInitCheck() {
    print('screenInitCheck 실행됨!'); // 로그 추가
    state = state.copyWith(screenInit: true);
    print('screenInit 변경 후: ${state.screenInit}'); // 변경된 값 로그 확인
  }
}

final menuProvider = StateNotifierProvider<MenuController, MenuState>((ref) {
  return MenuController();
});
