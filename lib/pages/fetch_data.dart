import 'package:flutter/material.dart';
import 'package:flutter_api/models/post_model.dart';
import 'package:flutter_api/services/post_service.dart';

class FetchDataPage extends StatefulWidget {
  const FetchDataPage({Key? key}) : super(key: key);

  @override
  State<FetchDataPage> createState() => _FetchDataPageState();
}

class _FetchDataPageState extends State<FetchDataPage> {
  final List<PostModel> _postList = [];
  bool _status = false;
  Future<void> _fetchPost() async {
    await PostService().fetchPost().then((value) {
      setState(() {
        _postList.addAll(value);
        _status = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data'),
      ),
      body: _status
          ? ListView.separated(
              itemBuilder: (context, index) {
                var _data = _postList[index];
                return ListTile(
                  leading: const Icon(Icons.emoji_emotions),
                  title: Text(
                    _data.title,
                    style: const TextStyle(fontSize: 20.0),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    _data.body,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text('${_data.id}(${_data.userId})'),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: _postList.length,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
