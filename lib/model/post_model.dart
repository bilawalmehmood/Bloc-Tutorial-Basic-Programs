import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {
  const factory PostModel({
    @Default(-1) @JsonKey(name: 'id') int id,
    @Default(-1) @JsonKey(name: 'userId') int uid,
    @Default('') @JsonKey(name: 'name') String title,
    @Default('') @JsonKey(name: 'email') String body,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  // final String uid;
  // final String id;
  // final String title;
  // final String body;1

  // const PostModel(
  //     {required this.id,
  //     required this.uid,
  //     required this.title,
  //     required this.body});

  // PostModel copyWith({String? id, String? uid, String? title, String? body}) {
  //   return PostModel(
  //       id: id ?? this.id,
  //       uid: uid ?? this.uid,
  //       title: title ?? this.title,
  //       body: body ?? this.body);
  // }

  // factory PostModel.fromJson(Map<String, dynamic> json) {
  //   return PostModel(
  //       id: '${json['id']}',
  //       uid: '${json['userId'] ?? ''}',
  //       title: json['name'],
  //       body: json['email']);
  // }

  // @override
  // List<Object?> get props => [id, uid, title, body];
}
