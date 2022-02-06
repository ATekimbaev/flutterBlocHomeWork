import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'container_bloc/container_bloc.dart';
import 'container_bloc/container_event.dart';
import 'container_bloc/container_state.dart';

void main(List<String> args) {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home work bloc',
          ),
        ),
        body: const MyAnimatedContainer(),
      ),
    );
  }
}

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({Key? key}) : super(key: key);

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

final containerBloc = ContainerBloc();

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ContainerBloc, ContainerState>(
          bloc: containerBloc,
          builder: (context, state) {
            if (state is ContanerStateValue) {
              return AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                width: state.width,
                height: state.height,
                decoration: BoxDecoration(
                  color: state.color,
                  borderRadius: state.borderRadius,
                ),
              );
            } else
              return Text('Error');
          },
        ),
        const Spacer(),
        Center(
          child: FloatingActionButton(
            onPressed: () {
              containerBloc.add(ContainerEventValue());
            },
            child: const Icon(Icons.play_arrow),
          ),
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
