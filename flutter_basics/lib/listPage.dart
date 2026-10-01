import 'package:flutter/material.dart';
import 'package:flutter_basics/addData.dart';
import 'package:flutter_basics/listMapProvider.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List")),
      body: Consumer<ListMapProvider>(
        builder: (context, value, child) {
          var allData = value.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                  itemCount: allData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text("${allData[index]['name']}"),
                      subtitle: Text("${allData[index]['mobNo']}"),
                    );
                  },
                )
              : Center(child: Text("No Data"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Adddata()),
          );
        },
        child: Icon(Icons.view_array),
      ),
    );
  }
}
