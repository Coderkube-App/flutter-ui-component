import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/common/cards/app_card.dart';

class DialogsTabView extends StatelessWidget {
  const DialogsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Dialogs & Overlays')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // ── Dialogs ────────────────────────────────────
          _SectionHeader('Dialogs'),
          const SizedBox(height: 12),
          AppCard(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showBasicDialog(context),
                  icon: const Icon(Icons.info_outline, size: 16),
                  label: const Text('Info Dialog'),
                ),
                OutlinedButton.icon(
                  onPressed: () => _showConfirmDialog(context),
                  icon: const Icon(Icons.warning_amber, size: 16),
                  label: const Text('Confirm Dialog'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _showInputDialog(context),
                  icon: const Icon(Icons.edit_outlined, size: 16),
                  label: const Text('Input Dialog'),
                  style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.secondary),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 50.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Bottom Sheets ──────────────────────────────
          _SectionHeader('Bottom Sheets'),
          const SizedBox(height: 12),
          AppCard(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: () => _showModalBottomSheet(context),
                  icon: const Icon(Icons.keyboard_arrow_up, size: 16),
                  label: const Text('Modal Sheet'),
                ),
                OutlinedButton.icon(
                  onPressed: () => _showListBottomSheet(context),
                  icon: const Icon(Icons.list_outlined, size: 16),
                  label: const Text('List Sheet'),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Snackbars ──────────────────────────────────
          _SectionHeader('Snackbars & Toasts'),
          const SizedBox(height: 12),
          AppCard(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _showSnackbar(context, 'Action completed successfully!', Icons.check_circle, Colors.green.shade700),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600),
                  child: const Text('Success'),
                ),
                ElevatedButton(
                  onPressed: () => _showSnackbar(context, 'Something went wrong. Try again.', Icons.error_outline, Colors.red.shade700),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade600),
                  child: const Text('Error'),
                ),
                ElevatedButton(
                  onPressed: () => _showSnackbar(context, 'Heads up! Please review.', Icons.warning_amber, Colors.orange.shade700),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade600),
                  child: const Text('Warning'),
                ),
                OutlinedButton(
                  onPressed: () => _showSnackbar(context, 'This is an info message.', Icons.info_outline, theme.colorScheme.primary),
                  child: const Text('Info'),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Tooltip ────────────────────────────────────
          _SectionHeader('Tooltips & FAB'),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Long-press the icons to see tooltips:'),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  children: [
                    Tooltip(message: 'Share this item', child: IconButton(icon: const Icon(Icons.share), onPressed: () {})),
                    Tooltip(message: 'Add to favourites', child: IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {})),
                    Tooltip(message: 'Download file', child: IconButton(icon: const Icon(Icons.download_outlined), onPressed: () {})),
                    Tooltip(message: 'Delete permanently', child: IconButton(icon: const Icon(Icons.delete_outline, color: Colors.red), onPressed: () {})),
                  ],
                ),
                const Divider(height: 24),
                const Text('FAB Variants:'),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    FloatingActionButton.small(onPressed: () {}, child: const Icon(Icons.add)),
                    FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
                    FloatingActionButton.extended(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Create')),
                  ],
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Date & Time Pickers ────────────────────────
          _SectionHeader('Date & Time Pickers'),
          const SizedBox(height: 12),
          AppCard(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton.icon(
                  onPressed: () => showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  ),
                  icon: const Icon(Icons.calendar_today, size: 16),
                  label: const Text('Date Picker'),
                ),
                OutlinedButton.icon(
                  onPressed: () => showTimePicker(context: context, initialTime: TimeOfDay.now()),
                  icon: const Icon(Icons.access_time, size: 16),
                  label: const Text('Time Picker'),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 250.ms).slideY(begin: 0.06),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ── Dialog helpers ──────────────────────────────────────────────────────────

  void _showBasicDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.info_outline, size: 40, color: Colors.blue),
        title: const Text('Information'),
        content: const Text('This is an informational dialog. It displays important messages to the user.'),
        actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Got it'))],
      ),
    );
  }

  void _showConfirmDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber_rounded, size: 40, color: Colors.orange),
        title: const Text('Are you sure?'),
        content: const Text('This action cannot be undone. Please confirm before proceeding.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Rename Item'),
        content: TextField(
          decoration: const InputDecoration(labelText: 'New Name', hintText: 'Enter name...', border: OutlineInputBorder()),
          autofocus: true,
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
          ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('Save')),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(2))),
            const SizedBox(height: 20),
            const Text('Modal Bottom Sheet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 12),
            const Text('This is a draggable modal bottom sheet. It slides up from the bottom of the screen.', textAlign: TextAlign.center),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('Close')),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showListBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(2))),
          const SizedBox(height: 16),
          ...[
            (Icons.camera_alt, 'Take Photo'),
            (Icons.photo_library, 'Choose from Library'),
            (Icons.file_upload, 'Upload File'),
            (Icons.link, 'Add Link'),
          ].map((item) => ListTile(
            leading: Icon(item.$1),
            title: Text(item.$2),
            onTap: () => Navigator.pop(ctx),
          )),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _showSnackbar(BuildContext context, String message, IconData icon, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(label: 'Dismiss', textColor: Colors.white, onPressed: () {}),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
  );
}
