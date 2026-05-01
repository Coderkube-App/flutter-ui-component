import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/cards/app_card.dart';

class WidgetsTabView extends StatefulWidget {
  const WidgetsTabView({super.key});

  @override
  State<WidgetsTabView> createState() => _WidgetsTabViewState();
}

class _WidgetsTabViewState extends State<WidgetsTabView> {
  bool _switch1 = true;
  bool _switch2 = false;
  bool _check1 = true;
  bool _check2 = false;
  bool _check3 = true;
  int _radioVal = 1;
  double _sliderVal = 0.4;
  String _selectedChip = 'Design';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // ── Chips ──────────────────────────────────────
          _SectionHeader('Chips & Badges'),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Filter Chips', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ['Design', 'Flutter', 'Motion', 'UI/UX', 'Code'].map((label) {
                    final selected = _selectedChip == label;
                    return FilterChip(
                      label: Text(label),
                      selected: selected,
                      onSelected: (_) => setState(() => _selectedChip = label),
                    );
                  }).toList(),
                ),
                const Divider(height: 28),
                Text('Badges', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: [
                    _BadgePill('New', AppColors.primaryLight),
                    _BadgePill('Beta', AppColors.info),
                    _BadgePill('Pro', AppColors.warning),
                    _BadgePill('Success', AppColors.success),
                    _BadgePill('Error', AppColors.errorLight),
                  ],
                ),
                const Divider(height: 28),
                Text('Action Chips', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    ActionChip(label: const Text('Share'), avatar: const Icon(Icons.share, size: 16), onPressed: () {}),
                    ActionChip(label: const Text('Favourite'), avatar: const Icon(Icons.favorite, size: 16), onPressed: () {}),
                    ActionChip(label: const Text('Save'), avatar: const Icon(Icons.bookmark, size: 16), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(delay: 50.ms).slideY(begin: 0.06, curve: Curves.easeOut),

          const SizedBox(height: 24),

          // ── Progress Indicators ────────────────────────
          _SectionHeader('Progress & Loading'),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Linear', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(value: 0.65, minHeight: 8),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(value: null, minHeight: 8,
                      color: theme.colorScheme.secondary),
                ),
                const Divider(height: 28),
                Text('Circular', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 24,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const CircularProgressIndicator(value: 0.75, strokeWidth: 5),
                    CircularProgressIndicator(value: null, strokeWidth: 5, color: theme.colorScheme.secondary),
                    CircularProgressIndicator(value: 0.4, strokeWidth: 5, color: AppColors.success),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.06, curve: Curves.easeOut),

          const SizedBox(height: 24),

          // ── Slider ─────────────────────────────────────
          _SectionHeader('Sliders'),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Volume', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.5))),
                    Text('${(_sliderVal * 100).round()}%', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
                Slider(
                  value: _sliderVal,
                  onChanged: (v) => setState(() => _sliderVal = v),
                ),
                const Divider(height: 4),
                RangeSlider(
                  values: const RangeValues(0.2, 0.7),
                  onChanged: (_) {},
                  labels: const RangeLabels('20%', '70%'),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.06, curve: Curves.easeOut),

          const SizedBox(height: 24),

          // ── Toggles ────────────────────────────────────
          _SectionHeader('Switches & Checkboxes'),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              children: [
                _SwitchTile('Enable Notifications', _switch1, Icons.notifications_outlined, (v) => setState(() => _switch1 = v)),
                _SwitchTile('Dark Mode Sync', _switch2, Icons.dark_mode_outlined, (v) => setState(() => _switch2 = v)),
                const Divider(height: 20),
                _CheckTile('Push Alerts', _check1, (v) => setState(() => _check1 = v!)),
                _CheckTile('Email Digest', _check2, (v) => setState(() => _check2 = v!)),
                _CheckTile('In-App Sound', _check3, (v) => setState(() => _check3 = v!)),
                const Divider(height: 20),
                ...[1, 2, 3].map((v) => _RadioTile(
                  label: 'Option $v',
                  value: v,
                  groupValue: _radioVal,
                  onChanged: (val) => setState(() => _radioVal = val),
                )),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.06, curve: Curves.easeOut),

          const SizedBox(height: 24),

          // ── List Tiles ─────────────────────────────────
          _SectionHeader('List Tiles'),
          const SizedBox(height: 12),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _ListTileItem(icon: Icons.person_outline, label: 'Account', trailing: Icons.chevron_right),
                const Divider(height: 1, indent: 56),
                _ListTileItem(icon: Icons.palette_outlined, label: 'Appearance', trailing: Icons.chevron_right),
                const Divider(height: 1, indent: 56),
                _ListTileItem(icon: Icons.lock_outline, label: 'Privacy', trailing: Icons.chevron_right),
                const Divider(height: 1, indent: 56),
                _ListTileItem(icon: Icons.help_outline, label: 'Help & Support', trailing: Icons.chevron_right),
              ],
            ),
          ).animate().fadeIn(delay: 250.ms).slideY(begin: 0.06, curve: Curves.easeOut),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ── Small helpers ─────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
  );
}

class _BadgePill extends StatelessWidget {
  final String label;
  final Color color;
  const _BadgePill(this.label, this.color);

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(20)),
    child: Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w600)),
  );
}

class _SwitchTile extends StatelessWidget {
  final String label;
  final bool value;
  final IconData icon;
  final ValueChanged<bool> onChanged;
  const _SwitchTile(this.label, this.value, this.icon, this.onChanged);

  @override
  Widget build(BuildContext context) => SwitchListTile(
    value: value,
    onChanged: onChanged,
    secondary: Icon(icon, size: 22),
    title: Text(label, style: Theme.of(context).textTheme.bodyMedium),
    dense: true,
  );
}

class _CheckTile extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;
  const _CheckTile(this.label, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) => CheckboxListTile(
    value: value,
    onChanged: onChanged,
    title: Text(label, style: Theme.of(context).textTheme.bodyMedium),
    dense: true,
    controlAffinity: ListTileControlAffinity.leading,
  );
}

class _RadioTile extends StatelessWidget {
  final String label;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  const _RadioTile({required this.label, required this.value, required this.groupValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 20, height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface.withValues(alpha: 0.4),
                  width: isSelected ? 6 : 2,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(label, style: theme.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _ListTileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final IconData? trailing;
  const _ListTileItem({required this.icon, required this.label, this.trailing});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withValues(alpha: 0.10),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 18, color: theme.colorScheme.primary),
      ),
      title: Text(label, style: theme.textTheme.bodyMedium),
      trailing: trailing != null ? Icon(trailing, size: 18, color: theme.colorScheme.onSurface.withValues(alpha: 0.4)) : null,
      onTap: () {},
    );
  }
}
