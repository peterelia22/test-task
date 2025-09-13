import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'change_color_state.dart';

class ChangeColorCubit extends Cubit<ChangeColorState> {
  ChangeColorCubit() : super(ChangeColorInitial());

  final Random _random = Random();

  void changeBackgroundColor() {
    final Color newColor = generateRandomColor();
    emit(ChangeColorUpdated(backgroundColor: newColor));
  }

  Color generateRandomColor() {
    const int maxColorValue = 256;

    final int red = _random.nextInt(maxColorValue);
    final int green = _random.nextInt(maxColorValue);
    final int blue = _random.nextInt(maxColorValue);

    return Color.fromRGBO(red, green, blue, 1.0);
  }
}
