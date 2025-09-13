import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/cubit/change_color_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeColorCubit, ChangeColorState>(
      builder: (context, state) {
        Color backgroundColor = Colors.white;
        Color textColor = Colors.black;

        if (state is ChangeColorUpdated) {
          backgroundColor = state.backgroundColor;
          textColor = _getTextColor(backgroundColor);
        }

        return GestureDetector(
          onTap: () {
            context.read<ChangeColorCubit>().changeBackgroundColor();
          },
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            height: double.infinity,
            color: backgroundColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello there',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  if (state is ChangeColorUpdated) ...[
                    const SizedBox(height: 24),
                    Text(
                      'RGB: ${(backgroundColor.r * 255).round()}, '
                      '${(backgroundColor.g * 255).round()}, '
                      '${(backgroundColor.b * 255).round()}',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap anywhere to change color',
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Color _getTextColor(Color backgroundColor) {
    final double luminance = backgroundColor.computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}
