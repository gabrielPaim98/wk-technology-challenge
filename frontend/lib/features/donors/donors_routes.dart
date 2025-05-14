import 'package:go_router/go_router.dart';

import 'domain/entities/donors_age_by_type.dart';
import 'domain/entities/donors_by_age.dart';
import 'domain/entities/donors_by_state.dart';
import 'domain/entities/donors_obesity_by_gender.dart';
import 'domain/entities/possible_donors.dart';
import 'presentation/pages/donors_age_by_type_page.dart';
import 'presentation/pages/donors_by_age_page.dart';
import 'presentation/pages/donors_by_state_page.dart';
import 'presentation/pages/donors_obesity_by_gender_page.dart';
import 'presentation/pages/donors_page.dart';
import 'presentation/pages/possible_donors_page.dart';

final donorsRoutes = [
  GoRoute(
    path: 'donors',
    builder: (context, state) => const DonorsPage(),
    routes: [
      GoRoute(
        path: 'age-by-type',
        builder: (context, state) => DonorsAgeByTypePage(
          donors: state.extra as List<DonorsAgeByType>,
        ),
      ),
      GoRoute(
        path: 'by-age',
        builder: (context, state) => DonorsByAgePage(
          donors: state.extra as List<DonorsByAge>,
        ),
      ),
      GoRoute(
        path: 'by-state',
        builder: (context, state) => DonorsByStatePage(
          donors: state.extra as List<DonorsByState>,
        ),
      ),
      GoRoute(
        path: 'obesity-by-gender',
        builder: (context, state) => DonorsObesityByGenderPage(
          donors: state.extra as List<DonorsObesityByGender>,
        ),
      ),
      GoRoute(
        path: 'possible-donors',
        builder: (context, state) => PossibleDonorsPage(
          donors: state.extra as List<PossibleDonors>,
        ),
      ),
    ],
  ),
];
