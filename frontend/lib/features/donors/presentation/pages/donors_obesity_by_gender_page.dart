import 'package:flutter/material.dart';

import '../../domain/entities/donors_obesity_by_gender.dart';

class DonorsObesityByGenderPage extends StatelessWidget {
  final List<DonorsObesityByGender> donors;

  const DonorsObesityByGenderPage({super.key, required this.donors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Percentual de obesos por gênero'),
      ),
      body: donors.isEmpty
          ? const Center(child: Text('Nenhum dado disponível'))
          : ListView.builder(
              itemCount: donors.length,
              itemBuilder: (context, index) {
                final item = donors[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.accessibility_new,
                        color: Colors.orange),
                    title: Text(
                      'Gênero: ${item.gender}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Percentual de obesos: ${item.percentage.toStringAsFixed(2)}%',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
