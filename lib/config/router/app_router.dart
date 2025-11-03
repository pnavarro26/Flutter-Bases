import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:widget_app/presentation/screens/screens.dart';

/// The route configuration.
final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/buttons',
      name: ButtonsScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const ButtonsScreen();
      },
    ),
    GoRoute(
      path: '/cards',
      name: CardsScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const CardsScreen();
      },
    ),
    GoRoute(
      path: '/progress',
      name: ProgressScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const ProgressScreen();
      },
    ),
    GoRoute(
      path: '/snackbars',
      name: SnackBarScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SnackBarScreen();
      },
    ),
    GoRoute(
      path: '/animated',
      name: AnimatedScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const AnimatedScreen();
      },
    ),
    GoRoute(
      path: '/ui-controlls',
      name: UiControlsScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const UiControlsScreen();
      },
    ),
    GoRoute(
      path: '/tutorial',
      name: AppTutorial.name,
      builder: (BuildContext context, GoRouterState state) {
        return const AppTutorial();
      },
    ),
    GoRoute(
      path: '/infinite',
      name: InfiniteScrollScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const InfiniteScrollScreen();
      },
    ),
    GoRoute(
      path: '/counter_screen',
      name: CounterScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const CounterScreen();
      },
    ),
    GoRoute(
      path: '/theme-changer',
      name: ThemeChanger.name,
      builder: (BuildContext context, GoRouterState state) {
        return const ThemeChanger();
      },
    ),
  ],
);
