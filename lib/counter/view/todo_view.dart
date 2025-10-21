import 'package:bloc_tutorial/counter/cubit/todo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: Center(
        child: BlocBuilder<TodoCubit, List<String>>(
          builder: (context, state) {
            return ListView.separated(itemBuilder: (context, index) {
              return Text(state[index]);
            }, separatorBuilder: (context, index) {
              return const SizedBox(height: 10.0,);
            }, itemCount: state.length);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key("todoView_Route_to_form_page"),
            onPressed: () {
              Navigator.pushNamed(context, "/add-todo");
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
