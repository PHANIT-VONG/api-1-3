import 'package:bloc/bloc.dart';
import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/services/post_service.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      try {
        emit(PostLoading());
        List<PostModel> _postList = await PostService().getPost();
        emit(PostSuccess(postList: _postList));
      } catch (e) {
        emit(PostError(message: e.toString()));
      }
    });
  }
}
