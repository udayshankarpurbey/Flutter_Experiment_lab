import 'package:flutter/material.dart';
import 'package:flutter_basics/counterProvider.dart';
import 'package:provider/provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build Called");
    return Scaffold(
      appBar: AppBar(title: Text("Counter Provider")),
      body: Center(
        child: Container(
          // child: Text(
          //   "${Provider.of<CounterProvider>(context, listen: true).getCount()}",
          // ),
          child: Consumer<CounterProvider>(
            builder: (ctx, _, _) {
              print("Consumer Called");
              return Text(
                // "${Provider.of<CounterProvider>(context, listen: true).getCount()}",
                // "${Provider.of<CounterProvider>(ctx, listen: true).getCount()}", // thsi help us to build only the chage part not the full widget .
                "${ctx.watch<CounterProvider>().getCount()}"
              );
            },
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Provider.of<CounterProvider>(
              //   context,
              //   listen: false,
              // ).decrementCount();
              context.read<CounterProvider>().decrementCount();
            },
            child: Icon(Icons.remove),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Provider.of<CounterProvider>(
              //   context,
              //   listen: false,
              // ).incrementCount();
              context.read<CounterProvider>().incrementCount();
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
