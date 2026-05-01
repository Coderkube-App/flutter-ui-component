import 'package:flutter/material.dart';
import '../../../core/widgets/common/cards/app_card.dart';

class TypographySection extends StatelessWidget {
  const TypographySection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Typography', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Heading 1', style: theme.textTheme.displayLarge),
              Text('Heading 2', style: theme.textTheme.displayMedium),
              Text('Heading 3', style: theme.textTheme.displaySmall),
              const Divider(height: 32),
              Text(
                'Body Large: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Body Medium: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
