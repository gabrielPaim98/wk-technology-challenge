import 'package:go_router/go_router.dart';

import '../../features/donors/donors_routes.dart';

final appRouter = GoRouter(
  initialLocation: '/donors',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_, state) {
        if (state.fullPath == '/') {
          return '/donors';
        }
        return null;
      },
      routes: [
        ...donorsRoutes,
      ],
    ),
  ],
);
