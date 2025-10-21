import 'package:bloc_tutorial/counter/cubit/todo_cubit.dart';
import 'package:bloc_tutorial/counter/view/add_todo_view.dart';
import 'package:bloc_tutorial/counter/view/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter/view/counter_page.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TodoCubit())
      ],
      child: MaterialApp(
          initialRoute: "/",
          routes: {
            "/": (_) => const TodoView(),
            "/add-todo": (_) => const AddTodoView(),
          }
      ),
    );
  }
}