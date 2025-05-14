import 'package:go_router/go_router.dart';

import 'presentation/pages/donors_page.dart';

final donorsRoutes = [
  GoRoute(
    path: 'donors',
    builder: (context, state) => const DonorsPage(),
  )
];
