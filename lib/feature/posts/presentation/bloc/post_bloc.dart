import 'package:bloc/bloc.dart';
import 'package:bloc_prectice/feature/posts/presentation/bloc/post_event.dart';
import 'package:bloc_prectice/feature/posts/presentation/bloc/post_state.dart';
import 'package:bloc_prectice/config/enums/status.dart';
import 'package:bloc_prectice/feature/posts/data/repositories/post_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  final PostRepositry postRepository = PostRepositry();
  PostBloc() : super(const PostState()){
    on<PostLoad>(fetchPosts);
  }

  void fetchPosts(PostLoad event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try{
      final posts = await postRepository.getPosts();
      emit(state.copyWith(posts: posts, status: Status.success));
    } catch(e){
      emit(state.copyWith(responseMessage: e.toString(), status: Status.error));
    }
  }
}