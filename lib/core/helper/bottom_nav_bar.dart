import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:investynn/core/const/app_assets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({required this.navigationShell, Key? key})
    : super(key: key ?? const ValueKey('BottomNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          mouseCursor: SystemMouseCursors.none,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          selectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
          unselectedLabelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),

          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(AppAssets.home, 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(AppAssets.portfolio, 1),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(AppAssets.market, 2),
              label: 'Market',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(AppAssets.stock, 3),
              label: 'stocks',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(AppAssets.more, 4),
              label: 'More',
            ),
          ],
          onTap: (index) {
            _goBranch(index);
          },
        ),
      ),
    );
  }

  Widget _buildIcon(String assetPath, int index) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        _currentIndex == index
            ? Theme.of(context)
                .colorScheme
                .primary // Selected color
            : Theme.of(context).colorScheme.onSurface, // Unselected color
        BlendMode.srcIn,
      ),
      child: Image.asset(assetPath),
    );
  }

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    setState(() {
      _currentIndex = index;
    });
  }
}
