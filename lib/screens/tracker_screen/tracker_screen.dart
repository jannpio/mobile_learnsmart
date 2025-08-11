import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '/widgets/custom_font.dart';

class TrackerScreen extends StatelessWidget {
  const TrackerScreen ({super.key});

  final List<_TechniqueData> techniques = const [
    _TechniqueData('Pomodoro', 67, '2h 10m this week', streak: 'Streak: 3 days'),
    _TechniqueData('Active Recall', 11, '1h 10m this week'),
    _TechniqueData('Spaced Repetition', 21, '0h 10m this week'),
    _TechniqueData('Feynman Technique', 0, '0m this week'),
    _TechniqueData('Retrieval Practice', 27, '5m this week'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F8FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomFont(
                text: "Study Tracker",
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              const SizedBox(height: 4),
              const CustomFont(
                text: "Time Spent by Technique",
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: _buildPieChart(techniques)),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: techniques.map((e) => _buildLegend(e)).toList(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ...techniques.map((e) => _buildTechniqueTile(e)).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPieChart(List<_TechniqueData> data) {
    final total = data.fold<double>(0, (sum, e) => sum + e.percent);
    return AspectRatio(
      aspectRatio: 1.2,
      child: PieChart(
        PieChartData(
          sections: data.map((e) {
            final index = data.indexOf(e);
            return PieChartSectionData(
              color: _colors[index % _colors.length],
              value: e.percent.toDouble(),
              title: "${e.percent.toInt()}%",
              titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
              radius: 50,
            );
          }).toList(),
          sectionsSpace: 2,
          centerSpaceRadius: 0,
        ),
      ),
    );
  }

  Widget _buildLegend(_TechniqueData data) {
    final index = techniques.indexOf(data);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 10,
            height: 10,
            margin: const EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _colors[index % _colors.length],
            ),
          ),
          CustomFont(
            text: '${data.label} ${data.percent.toInt()}%',
            fontSize: 12,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildTechniqueTile(_TechniqueData data) {
    final index = techniques.indexOf(data);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 18,
          backgroundColor: _colors[index % _colors.length],
        ),
        title: CustomFont(
          text: data.label,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFont(
              text: data.duration,
              fontSize: 12,
              color: Colors.black,
            ),
            if (data.streak != null)
              Row(
                children: const [
                  Icon(Icons.check_circle, color: Colors.green, size: 14),
                  SizedBox(width: 4),
                  CustomFont(
                    text: "Streak: 3 days",
                    fontSize: 12,
                    color: Colors.green,
                  ),
                ],
              ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
      ),
    );
  }
}

class _TechniqueData {
  final String label;
  final int percent;
  final String duration;
  final String? streak;

  const _TechniqueData(this.label, this.percent, this.duration, {this.streak});
}

const List<Color> _colors = [
  Color(0xFF0073FF),
  Color(0xFF00C9DB),
  Color(0xFF55D5D2),
  Color.fromARGB(255, 37, 12, 128),
  Color(0xFF3C4C78),
];
