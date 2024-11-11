import 'package:bloc_prectice/bloc/post/post_bloc.dart';
import 'package:bloc_prectice/bloc/post/post_event.dart';
import 'package:bloc_prectice/bloc/post/post_state.dart';
import 'package:bloc_prectice/enums/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
    @override
  void initState() {
    context.read<PostBloc>().add(PostLoad());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Posts'),
        ),
        body: BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
                switch(state.status){
                    case Status.loading:
                        return const Center(
                            child: CircularProgressIndicator(),
                        );
                    case Status.success:
                        return ListView.builder(
                            itemCount: state.posts.length,
                            itemBuilder: (context, index) {
                                final post = state.posts[index];
                                return ListTile(
                                    title: Text(post.title),
                                    subtitle: Text(post.body),
                                );
                            },
                        );
                    default:
                        return Center(
                            child: Text(state.responseMessage),
                        );
                }
            },
        ),
    );
  }
}