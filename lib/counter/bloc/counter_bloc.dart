import 'package:bloc/bloc.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(): super(0) {
    on<CounterIncremented>((event, emit) {
      print("This is increment event");
      emit(state + 1);
    });

    on<CounterDecremented>((event, emit) {
      print("This is decrement event");
      emit(state - 1);
    });

    on<CounterReset>((event, emit) {
      print("This is reset event");
      emit(0);
    });
  }
}