import 'package:bloc_prectice/enums/status.dart';
import 'package:bloc_prectice/model/post_model.dart';
import 'package:equatable/equatable.dart';

class PostState extends Equatable{
  final List<PostModel> posts;
  final Status status;
  final String responseMessage;

  const PostState({this.posts = const [], this.status = Status.loading, this.responseMessage = ''});

  PostState copyWith({List<PostModel>? posts, Status? status, String? responseMessage}){
    return PostState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      responseMessage: responseMessage ?? this.responseMessage
    );
  }

  @override
  List<Object?> get props => [posts, status, responseMessage];
}