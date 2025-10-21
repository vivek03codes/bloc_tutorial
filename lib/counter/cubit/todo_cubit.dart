import 'package:bloc/bloc.dart';

class TodoCubit extends Cubit<List<String>> {
  TodoCubit() : super([]);

  void addTodo(String todo) {
    state.add(todo);
    emit([...state]);
  }
}