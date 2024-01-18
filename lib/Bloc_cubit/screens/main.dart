import 'package:counter_state_management/Bloc_cubit/cubit/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building MyApp");
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(home: CounterApp()),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building CounterApp");
    // int number = 0;
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
                      context.read<CounterCubit>().incrementCounter();
                    },
                    child: Text("+")),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    print("Building Text");
                    return Text(state.counter.toString());
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrementCounter();
                    },
                    child: Text("-")),
              ],
            ),
            IconButton(
              onPressed: () {
                context.read<CounterCubit>().restartCounter();
              },
              icon: Icon(Icons.refresh),
            ),
          ],
        )));
  }
}
