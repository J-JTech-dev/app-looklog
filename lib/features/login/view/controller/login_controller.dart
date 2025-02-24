import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final bool isVisible;
  final bool isAutoLogin;

  LoginState({
    required this.isVisible,
    required this.isAutoLogin,
  });

  LoginState copyWith({
    bool? isVisible,
    bool? isAutoLogin,
  }) {
    return LoginState(isVisible: isVisible ?? this.isVisible, isAutoLogin: isAutoLogin ?? this.isAutoLogin);
  }
}

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState(isVisible: false, isAutoLogin: true),);

  bool get visible => state.isVisible;
  bool get autoLogin => state.isAutoLogin;

  // 상태를 변경하는 메서드
  void toggleVisible() {
    state = state.copyWith(isVisible: !state.isVisible);
  }

  void toggleAutoLogin() {
    state = state.copyWith(isAutoLogin: !state.isAutoLogin);
  }

}

final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController();
});
