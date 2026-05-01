import 'package:flutter/material.dart';

class ButtonLoader extends StatelessWidget {
  final double size;
  final double strokeWidth;

  const ButtonLoader({
    super.key,
    this.size = 24.0,
    this.strokeWidth = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
