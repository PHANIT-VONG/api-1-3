import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/pages/fetch_data.dart';
import 'package:flutter_api/pages/get_data_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              color: Colors.blue,
              child: const Text('Fetch Data'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FetchDataPage()),
                );
              },
            ),
            const SizedBox(height: 20.0),
            CupertinoButton(
              color: Colors.blue,
              child: const Text('Get Data Using Bloc'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GetDataBloc()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
