import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../injection_container.dart';
import '../bloc/donors_bloc.dart';
import '../widgets/primary_button.dart';

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
        if (state is DonorsLoadError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message ?? 'Erro desconhecido'),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state is DonorsSyncSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sincronização realizada com sucesso'),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state is DonorsAgeByTypeLoaded) {
          context.go(
            '/donors/age-by-type',
            extra: state.donorsAgeByType,
          );
        }

        if (state is DonorsByAgeLoaded) {
          context.go(
            '/donors/by-age',
            extra: state.donorsByAge,
          );
        }

        if (state is DonorsByStateLoaded) {
          context.go(
            '/donors/by-state',
            extra: state.donorsByState,
          );
        }

        if (state is DonorsObesityByGenderLoaded) {
          context.go(
            '/donors/obesity-by-gender',
            extra: state.donorsObesityByGender,
          );
        }

        if (state is DonorsPossibleDonorsLoaded) {
          context.go(
            '/donors/possible-donors',
            extra: state.possibleDonors,
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Column(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (state is DonorsLoading) const CircularProgressIndicator(),
                PrimaryButton(
                  text: 'Sincronizar doadores',
                  isLoading: state is DonorsSyncing,
                  onPressed: () {
                    context.read<DonorsBloc>().add(SyncDonorsEvent());
                  },
                ),
                PrimaryButton(
                  text: 'Doadores por estado',
                  isLoading: state is DonorsLoading,
                  onPressed: () {
                    context.read<DonorsBloc>().add(GetDonorsByStateEvent());
                  },
                ),
                PrimaryButton(
                  text: 'IMC médio por faixa etária',
                  isLoading: state is DonorsLoading,
                  onPressed: () {
                    context.read<DonorsBloc>().add(GetDonorsByAgeEvent());
                  },
                ),
                PrimaryButton(
                  text: 'Percentual de obesos',
                  isLoading: state is DonorsLoading,
                  onPressed: () {
                    context
                        .read<DonorsBloc>()
                        .add(GetDonorsObesityByGenderEvent());
                  },
                ),
                PrimaryButton(
                  text: 'Média de idade por tipo sanguíneo',
                  isLoading: state is DonorsLoading,
                  onPressed: () {
                    context.read<DonorsBloc>().add(GetDonorsAgeByTypeEvent());
                  },
                ),
                PrimaryButton(
                  text: 'Possível doadores',
                  isLoading: state is DonorsLoading,
                  onPressed: () {
                    context.read<DonorsBloc>().add(GetPossibleDonorsEvent());
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
