import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/authentication_bloc.dart';
import '../auth/authentication_event.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const Color purple = Color(0xFF6D5A9C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: const Color(0xFFFDF5FF),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: SizedBox(
            width: double.infinity,
            height: 42,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: purple,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              onPressed: () {
                context.read<AuthenticationBloc>().add(LoginRequested());
              },
              child: const Text('Login'),
            ),
          ),
        ),
      ),
    );
  }
}
