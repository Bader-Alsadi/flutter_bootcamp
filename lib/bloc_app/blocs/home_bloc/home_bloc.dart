import 'package:app/bloc_app/blocs/home_bloc/home_event.dart';
import 'package:app/bloc_app/blocs/home_bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int number = 0;
  HomeBloc(super.initialState) {
    on<AddToNumberEvent>((event, emit) {
      print("add evvent");
      emit(UpdateNumber(value: number++));
    });

    on<MinsToNumberEvent>((event, emit) {
      print("mins evvent");
      emit(UpdateNumber(value: number--));
    });
  }
}
