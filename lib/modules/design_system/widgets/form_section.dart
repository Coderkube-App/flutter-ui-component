import 'package:flutter/material.dart';
import '../../../core/widgets/common/cards/app_card.dart';
import '../../../core/widgets/common/forms/app_text_field.dart';

class FormSection extends StatelessWidget {
  const FormSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Form Fields', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        const AppCard(
          child: Column(
            children: [
              AppTextField(
                label: 'Email Address',
                hint: 'enter@email.com',
                prefixIcon: Icons.email_outlined,
              ),
              SizedBox(height: 20),
              AppTextField(
                label: 'Password',
                hint: '••••••••',
                isPassword: true,
                prefixIcon: Icons.lock_outline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
