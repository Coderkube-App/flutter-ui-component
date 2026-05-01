import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/widgets/common/cards/app_card.dart';

class NavigationTabView extends StatefulWidget {
  const NavigationTabView({super.key});

  @override
  State<NavigationTabView> createState() => _NavigationTabViewState();
}

class _NavigationTabViewState extends State<NavigationTabView>
    with SingleTickerProviderStateMixin {
  int _railIndex = 0;
  int _tabIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() => _tabIndex = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Navigation')),
      drawer: _DemoDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          // ── App Bar Variants ───────────────────────────
          _SectionHeader('App Bar Variants'),
          const SizedBox(height: 12),
          _AppBarPreview().animate().fadeIn(delay: 50.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Tab Bar ────────────────────────────────────
          _SectionHeader('Tab Bar'),
          const SizedBox(height: 12),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: const [
                    Tab(text: 'Feed'),
                    Tab(text: 'Trending'),
                    Tab(text: 'Saved'),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: Text(
                      ['📰 Feed Content', '🔥 Trending Content', '🔖 Saved Content'][_tabIndex],
                      style: theme.textTheme.bodyLarge,
                    ).animate(key: ValueKey(_tabIndex)).fadeIn().slideX(begin: 0.1),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Navigation Rail Preview ────────────────────
          _SectionHeader('Navigation Rail'),
          const SizedBox(height: 12),
          AppCard(
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 220,
              child: Row(
                children: [
                  NavigationRail(
                    selectedIndex: _railIndex,
                    onDestinationSelected: (i) => setState(() => _railIndex = i),
                    labelType: NavigationRailLabelType.selected,
                    destinations: const [
                      NavigationRailDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: Text('Home')),
                      NavigationRailDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: Text('Search')),
                      NavigationRailDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: Text('Profile')),
                    ],
                  ),
                  const VerticalDivider(width: 1),
                  Expanded(
                    child: Center(
                      child: Text(
                        ['🏠 Home', '🔍 Search', '👤 Profile'][_railIndex],
                        style: theme.textTheme.bodyLarge,
                      ).animate(key: ValueKey(_railIndex)).fadeIn().scale(begin: const Offset(0.9, 0.9)),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: 150.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Bottom Navigation Bar ──────────────────────
          _SectionHeader('Bottom Navigation Bar'),
          const SizedBox(height: 12),
          AppCard(
            padding: EdgeInsets.zero,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: _AnimatedBottomBarPreview(),
            ),
          ).animate().fadeIn(delay: 175.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Drawer Trigger ─────────────────────────────
          _SectionHeader('Drawer'),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tap to open the side drawer →', style: theme.textTheme.bodyMedium),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu),
                  label: const Text('Open Drawer'),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.06),

          const SizedBox(height: 24),

          // ── Breadcrumb / Stepper ───────────────────────
          _SectionHeader('Stepper'),
          const SizedBox(height: 12),
          AppCard(
            child: _AnimatedStepper(),
          ).animate().fadeIn(delay: 250.ms).slideY(begin: 0.06),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

// ── App Bar Preview card ──────────────────────────────────────────────────────
class _AppBarPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MiniAppBar(title: 'Standard', showBack: false),
          const SizedBox(height: 10),
          _MiniAppBar(title: 'With Back Arrow', showBack: true),
          const SizedBox(height: 10),
          _MiniAppBar(title: 'With Actions', showBack: false, showActions: true),
        ],
      ),
    );
  }
}

class _MiniAppBar extends StatelessWidget {
  final String title;
  final bool showBack;
  final bool showActions;
  const _MiniAppBar({required this.title, required this.showBack, this.showActions = false});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          if (showBack) const Icon(Icons.arrow_back, color: Colors.white, size: 20),
          if (showBack) const SizedBox(width: 8),
          Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 15))),
          if (showActions) ...[
            const Icon(Icons.search, color: Colors.white, size: 20),
            const SizedBox(width: 12),
            const Icon(Icons.more_vert, color: Colors.white, size: 20),
          ],
        ],
      ),
    );
  }
}

// ── Demo Drawer ───────────────────────────────────────────────────────────────
class _DemoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [theme.colorScheme.primary, theme.colorScheme.primary.withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(Icons.person, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 12),
                  const Text('John Doe', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
                  Text('john@example.com', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            ...[
              ('Home', Icons.home_outlined),
              ('Profile', Icons.person_outline),
              ('Settings', Icons.settings_outlined),
              ('Notifications', Icons.notifications_outlined),
              ('Help', Icons.help_outline),
            ].map((item) => ListTile(
              leading: Icon(item.$2),
              title: Text(item.$1),
              onTap: () => Navigator.pop(context),
            )),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Animated Stepper ──────────────────────────────────────────────────────────
class _AnimatedStepper extends StatefulWidget {
  @override
  State<_AnimatedStepper> createState() => _AnimatedStepperState();
}

class _AnimatedStepperState extends State<_AnimatedStepper> {
  int _step = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final steps = ['Account', 'Details', 'Review', 'Done'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: List.generate(steps.length * 2 - 1, (i) {
            if (i.isOdd) {
              final filled = i ~/ 2 < _step;
              return Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 3,
                  color: filled ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.15),
                ),
              );
            }
            final idx = i ~/ 2;
            final done = idx < _step;
            final active = idx == _step;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: done || active ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.1),
              ),
              child: Center(
                child: done
                    ? const Icon(Icons.check, color: Colors.white, size: 16)
                    : Text('${idx + 1}', style: TextStyle(
                        color: active ? Colors.white : theme.colorScheme.onSurface.withOpacity(0.4),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      )),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: steps.map((s) => Text(s, style: theme.textTheme.labelSmall)).toList(),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            if (_step > 0)
              OutlinedButton(onPressed: () => setState(() => _step--), child: const Text('Back')),
            const Spacer(),
            if (_step < steps.length - 1)
              ElevatedButton(onPressed: () => setState(() => _step++), child: const Text('Next')),
            if (_step == steps.length - 1)
              ElevatedButton(onPressed: () => setState(() => _step = 0), child: const Text('Restart')),
          ],
        ),
      ],
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

// ── Animated Bottom Bar Preview ───────────────────────────────────────────────
class _AnimatedBottomBarPreview extends StatefulWidget {
  @override
  State<_AnimatedBottomBarPreview> createState() => _AnimatedBottomBarPreviewState();
}

class _AnimatedBottomBarPreviewState extends State<_AnimatedBottomBarPreview> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final items = [
      (Icons.home_outlined, Icons.home, 'Home'),
      (Icons.favorite_outline, Icons.favorite, 'Likes'),
      (Icons.chat_bubble_outline, Icons.chat_bubble, 'Chat'),
      (Icons.person_outline, Icons.person, 'Profile'),
    ];

    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isActive = index == _currentIndex;
          final color = isActive ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.5);
          
          return GestureDetector(
            onTap: () => setState(() => _currentIndex = index),
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.symmetric(horizontal: isActive ? 16 : 12, vertical: 8),
              decoration: BoxDecoration(
                color: isActive ? theme.colorScheme.primary.withOpacity(0.12) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      isActive ? items[index].$2 : items[index].$1,
                      key: ValueKey(isActive),
                      color: color,
                      size: 24,
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOutCubic,
                    child: SizedBox(
                      width: isActive ? null : 0,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          items[index].$3,
                          maxLines: 1,
                          style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
