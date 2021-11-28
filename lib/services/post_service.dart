import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/repository/post_repository.dart';
import 'package:flutter_api/routes/routes_api.dart';
import 'package:http/http.dart' as http;

class PostService extends PostRepository {
  Future<List<PostModel>> fetchPost() async {
    final response = await http.get(Uri.parse(RoutesAPI.postUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postModelFromJson(jsonString);
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Future<List<PostModel>> getPost() async {
    final response = await http.get(Uri.parse(RoutesAPI.postUrl));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return postModelFromJson(jsonString);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
