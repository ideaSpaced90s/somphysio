import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../layout/app_shell.dart';
import '../screens/home_screen.dart';
import '../screens/journey_screen.dart';
import '../screens/books_screen.dart';
import '../screens/research_screen.dart';
import '../screens/contact_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionANavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/journey',
              builder: (context, state) => const JourneyScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/books',
              builder: (context, state) => const BooksScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/research',
              builder: (context, state) => const ResearchScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/contact',
              builder: (context, state) => const ContactScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);
