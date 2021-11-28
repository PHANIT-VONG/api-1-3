part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<PostModel> postList;

  PostSuccess({required this.postList});
}

class PostError extends PostState {
  final String message;

  PostError({required this.message});
}
