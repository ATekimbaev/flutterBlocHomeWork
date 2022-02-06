import 'package:flutter/material.dart';

abstract class ContainerState {}

class ContanerStateValue extends ContainerState {
  double width;
  double height;
  Color color;
  BorderRadius borderRadius;
  ContanerStateValue(
      {required this.height,
      required this.width,
      required this.borderRadius,
      required this.color});
}
