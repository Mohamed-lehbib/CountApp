import 'package:counter_state_management/Provider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building MyApp");
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MaterialApp(
        home: CounterApp(),
      ),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building CounterApp");
    return Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CounterProvider>(context, listen: false)
                          .incrementCounter();
                    },
                    child: Text("+")),
                Selector<CounterProvider, int>(
                  selector: (context, Counter) => Counter.counter,
                  builder: (context, counter, child) {
                    print("Build Counter");
                    return Text(
                      counter.toString(),
                    );
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Provider.of<CounterProvider>(context, listen: false)
                          .decrementCounter();
                    },
                    child: Text("-")),
              ],
            ),
            IconButton(
              onPressed: () {
                Provider.of<CounterProvider>(context, listen: false)
                    .restartCounter();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        )));
  }
}
