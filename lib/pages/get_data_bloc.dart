import 'package:flutter/material.dart';
import 'package:flutter_api/post_bloc/post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetDataBloc extends StatelessWidget {
  const GetDataBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Data Bloc'),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PostSuccess) {
            return ListView.separated(
              itemBuilder: (context, index) {
                var _data = state.postList[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(_data.userId.toString()),
                  ),
                  title: Text(
                    _data.title,
                    style: const TextStyle(fontSize: 20.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    _data.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text('${_data.id}(${_data.userId})'),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(color: Colors.grey);
              },
              itemCount: state.postList.length,
            );
          }
          if (state is PostError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Something went wrong!',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18.0),
                  TextButton(
                    onPressed: () {
                      context.read<PostBloc>().add(GetPostEvent());
                    },
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
