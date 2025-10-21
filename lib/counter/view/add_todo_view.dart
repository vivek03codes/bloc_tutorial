import 'package:bloc_tutorial/counter/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoView extends StatelessWidget {
  const AddTodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);
    final TextEditingController todoController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo Item"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: todoController,
            ),
            const SizedBox(height: 10.0,),
            ElevatedButton(onPressed: () {
              todoCubit.addTodo(todoController.text);
              Navigator.pop(context);
            }, child: Text("Add"))
          ],
        ),
      ),
    );
  }
}
