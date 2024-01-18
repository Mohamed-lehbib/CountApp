import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void incrementCounter() => emit(state.copyWith(counter: state.counter + 1));
  void decrementCounter() => emit(state.copyWith(counter: state.counter - 1));
  void restartCounter() => emit(state.copyWith(counter: 0));
}
