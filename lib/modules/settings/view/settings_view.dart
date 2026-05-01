import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/cards/app_card.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool _notifications = true;
  bool _haptics = true;
  bool _analytics = false;
  String _fontScale = 'Normal';
  String _accentColor = 'Purple';
  String _language = 'English';

  final Map<String, Color> _accents = {
    'Purple': AppColors.primaryLight,
    'Teal': const Color(0xFF03DAC6),
    'Blue': const Color(0xFF2196F3),
    'Orange': const Color(0xFFFF6B35),
    'Pink': const Color(0xFFE91E8C),
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: () => Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [

          // ── Profile Card ────────────────────────────────
          _buildProfileCard(theme)
              .animate().fadeIn(delay: 50.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Appearance ──────────────────────────────────
          _SettingGroupLabel('Appearance'),
          const SizedBox(height: 10),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _ThemeToggleTile(isDark: isDark),
                const Divider(height: 1, indent: 56),
                _SelectTile(
                  icon: Icons.format_size,
                  label: 'Font Size',
                  value: _fontScale,
                  options: ['Small', 'Normal', 'Large', 'Extra Large'],
                  onSelected: (v) => setState(() => _fontScale = v),
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: Container(
                    width: 36, height: 36,
                    decoration: BoxDecoration(color: theme.colorScheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.palette_outlined, size: 18, color: theme.colorScheme.primary),
                  ),
                  title: const Text('Accent Color'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ..._accents.entries.map((e) => GestureDetector(
                        onTap: () => setState(() => _accentColor = e.key),
                        child: Container(
                          width: 20, height: 20,
                          margin: const EdgeInsets.only(left: 6),
                          decoration: BoxDecoration(
                            color: e.value,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: _accentColor == e.key ? theme.colorScheme.onSurface : Colors.transparent,
                              width: 2,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.06),

          const SizedBox(height: 20),

          // ── Notifications ───────────────────────────────
          _SettingGroupLabel('Notifications'),
          const SizedBox(height: 10),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SwitchListTile(
                  secondary: _SettingIcon(Icons.notifications_outlined, theme),
                  title: const Text('Push Notifications'),
                  value: _notifications,
                  onChanged: (v) => setState(() => _notifications = v),
                ),
                const Divider(height: 1, indent: 56),
                SwitchListTile(
                  secondary: _SettingIcon(Icons.vibration, theme),
                  title: const Text('Haptic Feedback'),
                  value: _haptics,
                  onChanged: (v) => setState(() => _haptics = v),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.06),

          const SizedBox(height: 20),

          // ── Privacy & Data ──────────────────────────────
          _SettingGroupLabel('Privacy & Data'),
          const SizedBox(height: 10),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                SwitchListTile(
                  secondary: _SettingIcon(Icons.analytics_outlined, theme),
                  title: const Text('Usage Analytics'),
                  subtitle: const Text('Help improve the app'),
                  value: _analytics,
                  onChanged: (v) => setState(() => _analytics = v),
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: _SettingIcon(Icons.lock_outline, theme),
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.open_in_new, size: 16),
                  onTap: () {},
                ),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: _SettingIcon(Icons.delete_sweep_outlined, theme),
                  title: const Text('Clear Cache'),
                  trailing: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(8)),
                    child: Text('24 MB', style: theme.textTheme.labelSmall),
                  ),
                  onTap: () => _showClearCacheDialog(context),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.06),

          const SizedBox(height: 20),

          // ── Language ────────────────────────────────────
          _SettingGroupLabel('Region'),
          const SizedBox(height: 10),
          AppCard(
            padding: EdgeInsets.zero,
            child: _SelectTile(
              icon: Icons.language,
              label: 'Language',
              value: _language,
              options: ['English', 'Spanish', 'French', 'German', 'Japanese'],
              onSelected: (v) => setState(() => _language = v),
            ),
          ).animate().fadeIn(delay: 250.ms).slideY(begin: 0.06),

          const SizedBox(height: 20),

          // ── About ───────────────────────────────────────
          _SettingGroupLabel('About'),
          const SizedBox(height: 10),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _NavTile(Icons.info_outline, 'App Version', '1.0.0 (Build 1)', theme),
                const Divider(height: 1, indent: 56),
                _NavTile(Icons.star_outline, 'Rate the App', null, theme),
                const Divider(height: 1, indent: 56),
                _NavTile(Icons.share_outlined, 'Share with Friends', null, theme),
                const Divider(height: 1, indent: 56),
                ListTile(
                  leading: _SettingIcon(Icons.logout, theme, color: Colors.red),
                  title: const Text('Sign Out', style: TextStyle(color: Colors.red)),
                  onTap: () {},
                ),
              ],
            ),
          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.06),

          const SizedBox(height: 32),
          Center(
            child: Text(
              'UI Component System  •  v1.0.0',
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.35)),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildProfileCard(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.primary.withOpacity(0.75),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            width: 60, height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('John Doe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18)),
                const SizedBox(height: 2),
                Text('john@example.com', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 13)),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), borderRadius: BorderRadius.circular(20)),
                  child: const Text('Pro Member', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Clear Cache?'),
        content: const Text('This will remove all temporary files. Your data will not be affected.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('Clear')),
        ],
      ),
    );
  }
}

// ── Helper widgets ─────────────────────────────────────────────────────────────

class _SettingGroupLabel extends StatelessWidget {
  final String label;
  const _SettingGroupLabel(this.label);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(left: 4),
    child: Text(
      label.toUpperCase(),
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
  );
}

Widget _SettingIcon(IconData icon, ThemeData theme, {Color? color}) => Container(
  width: 36, height: 36,
  decoration: BoxDecoration(
    color: (color ?? theme.colorScheme.primary).withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Icon(icon, size: 18, color: color ?? theme.colorScheme.primary),
);

class _ThemeToggleTile extends StatelessWidget {
  final bool isDark;
  const _ThemeToggleTile({required this.isDark});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: _SettingIcon(isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined, theme),
      title: const Text('Theme'),
      trailing: Container(
        height: 32,
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurface.withOpacity(0.06),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: ['Light', 'Dark'].map((t) {
            final isSelected = (t == 'Dark') == isDark;
            return GestureDetector(
              onTap: () => Get.changeThemeMode(t == 'Dark' ? ThemeMode.dark : ThemeMode.light),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(t, style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : theme.colorScheme.onSurface.withOpacity(0.5),
                )),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _SelectTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final List<String> options;
  final ValueChanged<String> onSelected;
  const _SelectTile({required this.icon, required this.label, required this.value, required this.options, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: _SettingIcon(icon, theme),
      title: Text(label),
      trailing: GestureDetector(
        onTap: () => _showPicker(context),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary, fontWeight: FontWeight.w600)),
            const SizedBox(width: 4),
            Icon(Icons.chevron_right, size: 16, color: theme.colorScheme.onSurface.withOpacity(0.4)),
          ],
        ),
      ),
      onTap: () => _showPicker(context),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 12),
          ...options.map((opt) {
            final isSelected = opt == value;
            return ListTile(
              title: Text(opt),
              trailing: isSelected ? const Icon(Icons.check, color: Colors.blue) : null,
              onTap: () { onSelected(opt); Navigator.pop(ctx); },
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final ThemeData theme;
  const _NavTile(this.icon, this.title, this.subtitle, this.theme);

  @override
  Widget build(BuildContext context) => ListTile(
    leading: _SettingIcon(icon, theme),
    title: Text(title),
    subtitle: subtitle != null ? Text(subtitle!, style: theme.textTheme.bodySmall) : null,
    trailing: subtitle == null ? const Icon(Icons.chevron_right, size: 16) : null,
    onTap: () {},
  );
}
