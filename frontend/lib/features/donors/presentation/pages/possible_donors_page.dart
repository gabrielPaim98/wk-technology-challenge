import 'package:flutter/material.dart';

import '../../domain/entities/possible_donors.dart';

class PossibleDonorsPage extends StatelessWidget {
  final List<PossibleDonors> donors;

  const PossibleDonorsPage({super.key, required this.donors});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doadores Possíveis por Tipo de Receptor'),
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
                    leading:
                        const Icon(Icons.bloodtype, color: Colors.redAccent),
                    title: Text(
                      'Receptor: ${item.receptorType}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Quantidade de doadores: ${item.donorCount}',
                    ),
                  ),
                );
              },
            ),
    );
  }
}
