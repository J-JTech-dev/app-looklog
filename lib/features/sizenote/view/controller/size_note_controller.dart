import 'package:flutter_riverpod/flutter_riverpod.dart';

class SizeState {
  final bool check;
  final String category;
  final String brand;
  final String color;
  final Map<String,dynamic> detailData;

  SizeState({
    required this.check,
    required this.category,
    required this.brand,
    required this.color,
    required this.detailData,
  });

  SizeState copyWith({
    bool? check,
    String? category,
    String? brand,
    String? color,
    Map<String,dynamic>? detailData,
  }) {
    return SizeState(check: check ?? this.check,category: category ?? this.category,brand: brand ?? this.brand,color: color ?? this.color, detailData: detailData ?? this.detailData);
  }
}

class SizeNoteController extends StateNotifier<SizeState> {
  SizeNoteController() : super(SizeState(check: false, category: '', brand: '', color: '', detailData: {}),);

  bool get checkYn => state.check;
  String get category => state.category;
  String get brand => state.brand;
  String get color => state.color;
  Map<String,dynamic> get selectedData => state.detailData;

  // 상태를 변경하는 메서드
  void toggleCheck() {
    state = state.copyWith(check: !state.check); // 상태를 반전시킴
  }

  void selectData(String data, String type) {
    state = state.copyWith(
      category: type == "카테고리" ? data : state.category,
      brand: type == "브랜드" ? data : state.brand,
      color: type == "색상" ? data : state.color,
    );
  }

  void detailData(Map<String,dynamic> data) {
    state = state.copyWith(
      detailData: {
        'title': data['title'],
        'category': data['category'],
        'brand': data['brand'],
        'color': data['color'],
        'img': data['img'],
        'date': data['date'],
        'size': data['size'],
        'check': data['check'],
        'type': data['type'], //상의,하의,신발 구분
        'dressInfo': data['dressInfo'],
        'unit': data['unit'],
      }
    );
  }

}

final sizeNoteProvider = StateNotifierProvider<SizeNoteController, SizeState>((ref) {
  return SizeNoteController();
});
