import 'package:bloc_tutorial/counter/bloc/counter_bloc.dart';
import 'package:bloc_tutorial/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
        child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text("$state");
            },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key("counterView_increment_floatingActionButton"),
              onPressed: () => counterBloc.add(CounterIncremented()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('counterView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => counterBloc.add(CounterDecremented()),
          ),
        ],
      ),
    );
  }
}
