import 'package:bloc/bloc.dart';

sealed class CounterEvent {}

final class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent ,int> {
  CounterBloc(): super(0) {
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      emit(state - 1);
    });
  }
}