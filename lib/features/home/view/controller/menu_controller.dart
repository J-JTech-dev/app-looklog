import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuState {
  final bool isOpen;
  final int index;
  final bool menuVisible;

  MenuState({
    required this.isOpen,
    required this.index,
    required this.menuVisible,
  });
  
  MenuState copyWith({
    bool? isOpen,
    int? index,
    bool? menuVisible,
  }) {
    return MenuState(isOpen: isOpen ?? this.isOpen, index: index ?? this.index, menuVisible: menuVisible ?? this.menuVisible);
  }
}

class MenuController extends StateNotifier<MenuState> {
  MenuController() : super(MenuState(isOpen: false, index: -1, menuVisible: true),);

  bool get openYn => state.isOpen;  // isOpen 값을 가져오는 getter
  bool get menuVisible => state.menuVisible; //메뉴버튼 보일지말지
  int get menuIndex => state.index; //메뉴 인덱스 값 가져오는 getter

  // 상태를 변경하는 메서드
  void toggleMenu() {
    state = state.copyWith(isOpen: !state.isOpen); // 상태를 반전시킴
  }

  void navigateToMenu(int selectedIndex) {
    state = state.copyWith(index: selectedIndex);
  }

  void menuVisibleCheck(bool screenCheck) {
    print('screenCheck $screenCheck');
    state = state.copyWith(menuVisible: screenCheck);
  }
}

final menuProvider = StateNotifierProvider<MenuController, MenuState>((ref) {
  return MenuController();
});
