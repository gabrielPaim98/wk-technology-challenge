import 'package:flutter/material.dart';

import '../../domain/entities/donors_by_state.dart';

class DonorsByStatePage extends StatelessWidget {
  final List<DonorsByState> donors;

  const DonorsByStatePage({super.key, required this.donors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doadores por estado'),
      ),
      body: donors.isEmpty
          ? const Center(child: Text('Nenhum dado disponível'))
          : ListView.builder(
              itemCount: donors.length,
              itemBuilder: (context, index) {
                final donor = donors[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: ListTile(
                    leading: const Icon(Icons.location_on, color: Colors.green),
                    title: Text(
                      'Estado: ${donor.state}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Quantidade de doadores: ${donor.count}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
