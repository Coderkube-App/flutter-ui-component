import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/responsive_layout.dart';
import '../widgets/typography_section.dart';
import '../widgets/button_section.dart';
import '../widgets/form_section.dart';
import '../widgets/color_section.dart';

class DesignSystemView extends StatelessWidget {
  const DesignSystemView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Component System'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: const ResponsiveLayout(
          mobile: _DesignSystemContent(),
        ),
      ),
    );
  }
}

class _DesignSystemContent extends StatelessWidget {
  const _DesignSystemContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographySection(),
        SizedBox(height: 32),
        ButtonSection(),
        SizedBox(height: 32),
        FormSection(),
        SizedBox(height: 32),
        ColorSection(),
      ],
    );
  }
}
