import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bloc_homework/container_bloc/container_event.dart';
import 'package:bloc_homework/container_bloc/container_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerBloc extends Bloc<ContainerEvent, ContainerState> {
  final random = Random();
  ContainerBloc()
      : super(
          ContanerStateValue(
            width: 50,
            height: 50,
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(8),
          ),
        ) {
    on<ContainerEventValue>(
      (event, emit) => emit(
        ContanerStateValue(
          width: (state as ContanerStateValue).height =
              Random().nextInt(300).toDouble(),
          height: (state as ContanerStateValue).height =
              Random().nextInt(300).toDouble(),
          color: (state as ContanerStateValue).color = Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          ),
          borderRadius: (state as ContanerStateValue).borderRadius =
              BorderRadius.circular(random.nextInt(100).toDouble()),
        ),
      ),
    );
  }
}
