import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/donors_bloc.dart';

class DonorsPage extends StatelessWidget {
  const DonorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DonorsBloc>(
      create: (context) => sl(),
      child: const Scaffold(
        body: SafeArea(
          child: DonorsPageWidget(),
        ),
      ),
    );
  }
}

class DonorsPageWidget extends StatelessWidget {
  const DonorsPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DonorsBloc, DonorsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Center(
          child: Text('Donors Page'),
        );
      },
    );
  }
}
