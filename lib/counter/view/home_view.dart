import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 20.0,
        children: [
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, "/counter");
          }, child: const Text("Counter")),
          ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, "/todo-list");
          }, child: const Text("Todo")),
        ],
      ),
    );
  }
}
