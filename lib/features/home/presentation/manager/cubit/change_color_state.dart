part of 'change_color_cubit.dart';

@immutable
sealed class ChangeColorState {}

final class ChangeColorInitial extends ChangeColorState {}

final class ChangeColorUpdated extends ChangeColorState {
  ChangeColorUpdated({required this.backgroundColor});

  final Color backgroundColor;
}
