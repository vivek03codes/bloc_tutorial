import 'package:bloc_tutorial/counter/bloc/auth/auth_bloc.dart';
import 'package:bloc_tutorial/counter/bloc/auth/auth_event.dart';
import 'package:bloc_tutorial/counter/bloc/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }

        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (Route<dynamic> route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20.0,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Enter email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      AuthLoginRequested(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                      ),
                    );
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
