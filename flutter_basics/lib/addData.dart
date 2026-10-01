import 'package:flutter/material.dart';
import 'package:flutter_basics/listMapProvider.dart';
import 'package:provider/provider.dart';

class Adddata extends StatelessWidget {
  const Adddata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: IconButton(
          onPressed: () {
            context.read<ListMapProvider>().addData({
              "name": "test",
              "mobNo": "7549xxxxxx",
            });
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
