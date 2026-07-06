import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/responsive_wrapper.dart';
import '../widgets/site_header.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({
    super.key,
    required this.navigationShell,
  });

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      mobile: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Journey'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
            BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Research'),
            BottomNavigationBarItem(icon: Icon(Icons.collections), label: 'Gallery'),
            BottomNavigationBarItem(icon: Icon(Icons.contact_mail), label: 'Contact'),
          ],
        ),
      ),
      desktop: Scaffold(
        appBar: SiteHeader(
          currentIndex: navigationShell.currentIndex,
          onDestinationSelected: (index) => _onTap(context, index),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: navigationShell,
          ),
        ),
      ),
    );
  }
}
