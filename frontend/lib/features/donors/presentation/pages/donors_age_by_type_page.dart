import 'package:flutter/material.dart';

import '../../domain/entities/donors_age_by_type.dart';

class DonorsAgeByTypePage extends StatelessWidget {
  const DonorsAgeByTypePage({
    super.key,
    required this.donors,
  });

  final List<DonorsAgeByType> donors;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Média de idade por tipo sanguíneo'),
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
                    leading: const Icon(Icons.bloodtype, color: Colors.red),
                    title: Text(
                      'Tipo sanguíneo: ${donor.bloodType}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Idade média: ${donor.averageAge.toStringAsFixed(1)} anos',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
