import 'package:flutter/material.dart';
import 'package:test_task/features/home/presentation/manager/cubit/change_color_cubit.dart';
import 'package:test_task/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeColorCubit(),
      child: const Scaffold(body: HomeViewBody()),
    );
  }
}
