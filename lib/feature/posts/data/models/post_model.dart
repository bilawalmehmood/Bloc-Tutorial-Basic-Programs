import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @Default(-1) @JsonKey(name: 'id')int id,
    @Default(-1) @JsonKey(name: 'userId')int uid,
    @Default('') @JsonKey(name: 'name')String title,
    @Default('') @JsonKey(name: 'email')String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
