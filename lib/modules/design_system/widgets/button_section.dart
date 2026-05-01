import 'package:flutter/material.dart';
import '../../../core/widgets/common/buttons/app_button.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Buttons', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _ButtonWrapper(
              child: AppButton(
                text: 'Primary Button',
                onPressed: () {},
                icon: Icons.rocket_launch,
              ),
            ),
            _ButtonWrapper(
              child: AppButton(
                text: 'Secondary Button',
                onPressed: () {},
                isSecondary: true,
              ),
            ),
            _ButtonWrapper(
              child: AppButton(
                text: 'Loading Button',
                onPressed: () {},
                isLoading: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ButtonWrapper extends StatelessWidget {
  final Widget child;
  const _ButtonWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 250, child: child);
  }
}
