import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuState {
  final bool isOpen;

  MenuState({
    required this.isOpen,
  });
  
  MenuState copyWith({
    bool? isOpen,
  }) {
    return MenuState(isOpen: isOpen ?? this.isOpen);
  }
}

class MenuController extends StateNotifier<MenuState> {
  MenuController() : super(MenuState(isOpen: false),);

  bool get openYn => state.isOpen;  // isOpen 값을 가져오는 getter

  // 상태를 변경하는 메서드
  void toggleMenu() {
    print('state ${state.isOpen}');
    state = state.copyWith(isOpen: !state.isOpen); // 상태를 반전시킴
  }
}

final menuProvider = StateNotifierProvider<MenuController, MenuState>((ref) {
  return MenuController();
});
