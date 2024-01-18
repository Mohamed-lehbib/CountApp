part of 'counter_cubit.dart';

class CounterState {
  int counter;

  CounterState({required this.counter});

  factory CounterState.initial() => CounterState(counter: 0);

  CounterState copyWith({int? counter}) =>
      CounterState(counter: counter ?? this.counter);
}
