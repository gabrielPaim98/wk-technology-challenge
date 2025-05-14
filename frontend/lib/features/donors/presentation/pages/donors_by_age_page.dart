import 'package:flutter/material.dart';

import '../../domain/entities/donors_by_age.dart';

class DonorsByAgePage extends StatelessWidget {
  final List<DonorsByAge> donors;

  const DonorsByAgePage({super.key, required this.donors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC médio por faixa etária'),
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
                    leading:
                        const Icon(Icons.accessibility_new, color: Colors.blue),
                    title: Text(
                      'Faixa etária: ${donor.ageRange}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'IMC médio: ${donor.averageBmi.toStringAsFixed(2)}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
