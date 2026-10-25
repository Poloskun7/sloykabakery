import 'package:go_router/go_router.dart';
import 'routes.dart';
import '../widgets/navigation.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/menu/presentation/menu_screen.dart';
import '../../features/cafes/presentation/cafes_screen.dart';
import '../../features/favorites/presentation/favorites_screen.dart';

// A factory gives tests their own navigation state instead of sharing one router.
GoRouter createRouter() => GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) =>
          Navigation(location: state.uri.path, child: child),
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (_, state) =>
              NoTransitionPage(key: state.pageKey, child: const HomeScreen()),
        ),
        GoRoute(
          path: Routes.menu,
          pageBuilder: (_, state) =>
              NoTransitionPage(key: state.pageKey, child: MenuScreen()),
        ),
        GoRoute(
          path: Routes.cafes,
          pageBuilder: (_, state) =>
              NoTransitionPage(key: state.pageKey, child: const CafesScreen()),
        ),
        GoRoute(
          path: Routes.favorites,
          pageBuilder: (_, state) => NoTransitionPage(
            key: state.pageKey,
            child: const FavoritesScreen(),
          ),
        ),
      ],
    ),
  ],
);

final router = createRouter();
