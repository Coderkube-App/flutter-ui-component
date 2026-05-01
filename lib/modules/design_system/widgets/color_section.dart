import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class ColorSection extends StatelessWidget {
  const ColorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Colors', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _ColorCircle(color: theme.colorScheme.primary, label: 'Primary'),
            _ColorCircle(color: theme.colorScheme.secondary, label: 'Secondary'),
            _ColorCircle(color: AppColors.success, label: 'Success'),
            _ColorCircle(color: AppColors.warning, label: 'Warning'),
            _ColorCircle(color: AppColors.errorLight, label: 'Error'),
          ],
        ),
      ],
    );
  }
}

class _ColorCircle extends StatelessWidget {
  final Color color;
  final String label;

  const _ColorCircle({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
