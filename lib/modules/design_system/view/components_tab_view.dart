import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/typography_section.dart';
import '../widgets/button_section.dart';
import '../widgets/form_section.dart';
import '../widgets/color_section.dart';

class ComponentsTabView extends StatelessWidget {
  const ComponentsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Components'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          TypographySection(),
          SizedBox(height: 32),
          ButtonSection(),
          SizedBox(height: 32),
          FormSection(),
          SizedBox(height: 32),
          ColorSection(),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
