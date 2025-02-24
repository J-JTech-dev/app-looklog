import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeState {
  final bool check;

  SizeState({
    required this.check,
  });

  SizeState copyWith({
    bool? check,
  }) {
    return SizeState(check: check ?? this.check);
  }
}

class SizeNoteController extends StateNotifier<SizeState> {
  SizeNoteController() : super(SizeState(check: false),);

  bool get checkYn => state.check;  // check 값을 가져오는 getter

  // 상태를 변경하는 메서드
  void toggleCheck() {
    state = state.copyWith(check: !state.check); // 상태를 반전시킴
  }

}

final sizeNoteProvider = StateNotifierProvider<SizeNoteController, SizeState>((ref) {
  return SizeNoteController();
});
