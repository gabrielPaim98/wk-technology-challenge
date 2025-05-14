import 'package:get_it/get_it.dart';

import 'features/donors/donors_injection_container.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Modules
  await initializeDonorsInjectionContainer(sl);
}
