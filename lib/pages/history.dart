import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class HistoriquePage extends StatelessWidget {
  final List<Map<String, dynamic>> niveauxGaz;

  HistoriquePage({super.key})
      : niveauxGaz = List.generate(7, (index) {
          return {
            'date': DateTime.now().subtract(Duration(days: 6 - index)),
            'niveau': 75 - (index * 5),
          };
        });

  String formatDate(DateTime date) => DateFormat('dd/MM').format(date);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        title: const Text('📊 Historique de suivi du volume de Gaz utilisé'),
        backgroundColor: Color.fromARGB(255, 196, 88, 10),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Carte Graphique
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.trending_up, color: Colors.blueAccent),
                        SizedBox(width: 8),
                        Text(
                          "Évolution du niveau de gaz",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            colors: [Colors.blueAccent],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: true),
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(
                              showTitles: true,
                              interval: 1,
                              getTitles: (value) {
                                int index = value.toInt();
                                if (index < 0 || index >= niveauxGaz.length)
                                  return '';
                                return formatDate(niveauxGaz[index]['date']);
                              },
                            ),
                            leftTitles: SideTitles(showTitles: true),
                          ),
                          borderData: FlBorderData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              spots: niveauxGaz
                                  .asMap()
                                  .entries
                                  .map((e) => FlSpot(e.key.toDouble(),
                                      e.value['niveau'].toDouble()))
                                  .toList(),
                              color: Colors.blueAccent,
                              barWidth: 4,
                              isStrokeCapRound: true,
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [
                                  Colors.blueAccent.withOpacity(0.3),
                                  const Color.fromARGB(255, 37, 70, 126)
                                      .withOpacity(0.7),
                                ],
                              ),
                              dotData: FlDotData(show: true),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Liste
            Expanded(
              child: ListView.builder(
                itemCount: niveauxGaz.length,
                itemBuilder: (context, index) {
                  final jour = niveauxGaz[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(Icons.calendar_today,
                            color: Colors.white, size: 18),
                      ),
                      title: Text(formatDate(jour['date']),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      trailing: Text('${jour['niveau']} %',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue)),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Boutons Export
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Export CSV
                    },
                    icon: const Icon(Icons.download_rounded),
                    label: const Text("Exporter en CSV"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Export PDF
                    },
                    icon: const Icon(Icons.picture_as_pdf_rounded),
                    label: const Text("Exporter en PDF"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
