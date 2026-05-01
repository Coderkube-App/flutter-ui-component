import 'package:flutter/material.dart';
import 'button_loader.dart';
import 'button_content.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isSecondary;
  final IconData? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isSecondary = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    final style = isSecondary
        ? ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: theme.colorScheme.primary,
            side: BorderSide(color: theme.colorScheme.primary),
            elevation: 0,
          )
        : null;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: style,
        child: isLoading
            ? const ButtonLoader()
            : ButtonContent(text: text, icon: icon),
      ),
    );
  }
}
