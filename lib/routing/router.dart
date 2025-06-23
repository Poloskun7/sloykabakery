import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sloykabakery/routing/routers.dart';
import 'package:sloykabakery/ui/core/ui/navigation.dart';
import 'package:sloykabakery/ui/home/widgets/feedback_screen.dart';
import 'package:sloykabakery/ui/home/widgets/thank_you_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routers.home,
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation(initialIndex: 0);
      },
    ),
    GoRoute(
      path: Routers.menu,
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation(initialIndex: 1);
      },
    ),
    GoRoute(
      path: Routers.addresses,
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation(initialIndex: 2);
      },
    ),
    GoRoute(
      path: Routers.corporateMeals,
      builder: (BuildContext context, GoRouterState state) {
        return const Navigation(initialIndex: 3);
      },
    ),
    GoRoute(
      path: Routers.feedback,
      builder: (BuildContext context, GoRouterState state) {
        return const FeedbackScreen();
      },
    ),
    GoRoute(
      path: Routers.thankYou,
      builder: (BuildContext context, GoRouterState state) {
        return const ThankYouScreen();
      },
    ),
  ],
);