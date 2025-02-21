import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_item_model.freezed.dart';
part 'today_item_model.g.dart';

@freezed
class TodayItemModel with _$TodayItemModel {
  factory TodayItemModel({
    String? imageUrl,
    String? content,
  }) = _TodayItemModel;

  factory TodayItemModel.fromJson(Map<String, dynamic> json) =>
      _$TodayItemModelFromJson(json);
}
