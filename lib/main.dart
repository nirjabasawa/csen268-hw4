import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/authentication_bloc.dart';
import 'router/app_router.dart';

void main() {
  runApp(
    BlocProvider(create: (_) => AuthenticationBloc(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthenticationBloc>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: createRouter(authBloc),
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6D5A9C)),
      ),
    );
  }
}
