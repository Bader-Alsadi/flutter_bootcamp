import 'package:app/bloc_app/blocs/home_bloc/home_bloc.dart';
import 'package:app/bloc_app/blocs/home_bloc/home_state.dart';
import 'package:app/bloc_app/presention/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      title: 'Material App',
      home: BlocProvider(
          create: (context) => HomeBloc(InitNumberState()),
          child: HomeScreen()),
    );
  }
}
