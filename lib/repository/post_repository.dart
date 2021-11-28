import 'package:flutter_api/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> getPost();
}
