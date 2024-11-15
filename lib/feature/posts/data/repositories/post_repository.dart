import 'dart:convert';

import 'package:bloc_prectice/feature/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepositry {

  Future<List<PostModel>> getPosts() async {
    List<PostModel> posts =[];
    try{
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if(response.statusCode == 200){
        final List<dynamic> data = json.decode(response.body);
        for (var element in data) {
          posts.add(PostModel.fromJson(element));
        }
      }
      return posts;
    } catch(e){
      throw Exception(e.toString());
    }
  }
}