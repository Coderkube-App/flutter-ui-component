import 'package:flutter/material.dart';
import '../../design_system/view/components_tab_view.dart';
import '../../design_system/view/widgets_tab_view.dart';
import '../../design_system/view/navigation_tab_view.dart';
import '../../design_system/view/dialogs_tab_view.dart';
import '../../settings/view/settings_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> with TickerProviderStateMixin {
  int _currentIndex = 0;

  final List<_NavItem> _navItems = const [
    _NavItem(icon: Icons.widgets_outlined, activeIcon: Icons.widgets, label: 'Components'),
    _NavItem(icon: Icons.tune_outlined, activeIcon: Icons.tune, label: 'Widgets'),
    _NavItem(icon: Icons.navigation_outlined, activeIcon: Icons.navigation, label: 'Navigation'),
    _NavItem(icon: Icons.layers_outlined, activeIcon: Icons.layers, label: 'Dialogs'),
    _NavItem(icon: Icons.settings_outlined, activeIcon: Icons.settings, label: 'Settings'),
  ];

  final List<Widget> _pages = const [
    ComponentsTabView(),
    WidgetsTabView(),
    NavigationTabView(),
    DialogsTabView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.04, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
              child: child,
            ),
          );
        },
        child: KeyedSubtree(
          key: ValueKey(_currentIndex),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: _AnimatedBottomBar(
        currentIndex: _currentIndex,
        navItems: _navItems,
        isDark: isDark,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const _NavItem({required this.icon, required this.activeIcon, required this.label});
}

class _AnimatedBottomBar extends StatelessWidget {
  final int currentIndex;
  final List<_NavItem> navItems;
  final bool isDark;
  final ValueChanged<int> onTap;

  const _AnimatedBottomBar({
    required this.currentIndex,
    required this.navItems,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, -4),
          ),
        ],
        border: Border(
          top: BorderSide(color: theme.colorScheme.onSurface.withOpacity(0.06)),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 68,
          child: Row(
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              final isActive = index == currentIndex;
              return Expanded(
                child: _NavBarItem(
                  item: item,
                  isActive: isActive,
                  onTap: () => onTap(index),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final _NavItem item;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.88).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    _controller.forward().then((_) => _controller.reverse());
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = widget.isActive ? theme.colorScheme.primary : theme.colorScheme.onSurface.withOpacity(0.45);

    return GestureDetector(
      onTap: _handleTap,
      behavior: HitTestBehavior.opaque,
      child: ScaleTransition(
        scale: _scaleAnim,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOut,
              width: widget.isActive ? 52 : 0,
              height: widget.isActive ? 30 : 0,
              decoration: BoxDecoration(
                color: widget.isActive ? theme.colorScheme.primary.withOpacity(0.12) : Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    widget.isActive ? widget.item.activeIcon : widget.item.icon,
                    key: ValueKey(widget.isActive),
                    size: 22,
                    color: color,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: widget.isActive ? 11 : 10.5,
                fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w400,
                color: color,
              ),
              child: Text(widget.item.label),
            ),
          ],
        ),
      ),
    );
  }
}
