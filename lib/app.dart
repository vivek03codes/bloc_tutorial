import 'package:bloc_tutorial/counter/bloc/auth/auth_bloc.dart';
import 'package:bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:bloc_tutorial/counter/counter.dart';
import 'package:bloc_tutorial/counter/cubit/todo_cubit.dart';
import 'package:bloc_tutorial/counter/view/add_todo_view.dart';
import 'package:bloc_tutorial/counter/view/counter_view.dart';
import 'package:bloc_tutorial/counter/view/home_view.dart';
import 'package:bloc_tutorial/counter/view/login_view.dart';
import 'package:bloc_tutorial/counter/view/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => TodoCubit()),
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create: (_) => CounterCubit())
      ],
      child: MaterialApp(
          initialRoute: "/",
          routes: {
            "/": (_) => const LoginScreen(),
            "/home": (_) => const HomeScreen(),
            "/counter": (_) => const CounterView(),
            "/todo-list": (_) => TodoView(),
            "/add-todo": (_) => const AddTodoView(),
          }
      ),
    );
  }
}