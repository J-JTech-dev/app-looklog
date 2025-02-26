import 'package:flutter_riverpod/flutter_riverpod.dart';

class ColorMatchingState {
  final String topColor;
  final String bottomColor;
  final String shoesColor;

  ColorMatchingState({
    required this.topColor,
    required this.bottomColor,
    required this.shoesColor,
  });

  ColorMatchingState copyWith({
    String? topColor,
    String? bottomColor,
    String? shoesColor,
    Map<String,dynamic>? detailData,
  }) {
    return ColorMatchingState(topColor: topColor ?? this.topColor,bottomColor: bottomColor ?? this.bottomColor,shoesColor: shoesColor ?? this.shoesColor);
  }
}

class ColorMatchingController extends StateNotifier<ColorMatchingState> {
  ColorMatchingController() : super(ColorMatchingState(topColor: '', bottomColor: '', shoesColor: ''),);

  String get topColor => state.topColor;
  String get bottomColor => state.bottomColor;
  String get shoesColor => state.shoesColor;

  void selectColor(String data, String type) {
    final Map<String, String> colorMap = {
      "블랙": "black",
      "라벤더": "lavender",
      "핑크": "pink",
      "화이트": "white",
      "레드": "red",
      "블루": "blue",
      "그린": "green",
      "옐로우": "yellow",
      "카키": "khaki",
      "오렌지": "orange",
      "네이비": "navy",
      "퍼플": "purple",
      "스카이블루": "skyblue",
      "와인": "wine",
      "브라운": "brown",
      "그레이": "gray",
    };

    // 변환 적용 (한글 색상이 존재하면 영어로 변환, 없으면 원본 사용)
    String convertedColor = colorMap[data] ?? data;

    state = state.copyWith(
      topColor: type == "상의" ? convertedColor : state.topColor,
      bottomColor: type == "하의" ? convertedColor : state.bottomColor,
      shoesColor: type == "신발" ? convertedColor : state.shoesColor,
    );
  }

}

final colorMatchingProvider = StateNotifierProvider<ColorMatchingController, ColorMatchingState>((ref) {
  return ColorMatchingController();
});
