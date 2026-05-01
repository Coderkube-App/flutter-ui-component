import 'package:flutter/material.dart';
import 'field_label.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final TextEditingController? controller;
  final bool isPassword;
  final IconData? prefixIcon;
  final TextInputType keyboardType;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FieldLabel(label: label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          decoration: _buildDecoration(context),
        ),
      ],
    );
  }

  InputDecoration _buildDecoration(BuildContext context) {
    final theme = Theme.of(context);
    return InputDecoration(
      hintText: hint,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
      filled: true,
      fillColor: theme.colorScheme.surface,
      border: _outlineBorder(theme.colorScheme.outline.withOpacity(0.2)),
      enabledBorder: _outlineBorder(theme.colorScheme.outline.withOpacity(0.1)),
      focusedBorder: _outlineBorder(theme.colorScheme.primary, width: 2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  OutlineInputBorder _outlineBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
