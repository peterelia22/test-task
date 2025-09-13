import 'package:flutter/material.dart';
import 'package:test_task/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const TestTask());
}

class TestTask extends StatelessWidget {
  const TestTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
