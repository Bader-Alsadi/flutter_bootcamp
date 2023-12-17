import 'package:app/bloc_app/blocs/home_bloc/home_bloc.dart';
import 'package:app/bloc_app/blocs/home_bloc/home_event.dart';
import 'package:app/bloc_app/blocs/home_bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            context.read<HomeBloc>().add(MinsToNumberEvent());
          }),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is UpdateNumber) {
              return Text(
                state.value.toString(),
                style: TextStyle(color: Colors.amber, fontSize: 40),
              );
            } else
              return Text(
                "0",
                style: TextStyle(color: Colors.amber, fontSize: 40),
              );
          },
        ),
      ),
    );
  }
}
