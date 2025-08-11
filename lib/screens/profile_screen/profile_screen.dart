import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '/widgets/custom_font.dart';
import '/screens/settings_screen/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Dummy frontend values
  String username = "John Doe";
  String? avatarUrl; // null = use placeholder image
  double totalStudyHours = 42.5;

  final Map<String, double> studyHoursByActivity = {
    "Reading": 10.5,
    "Quizzes": 8.0,
    "Videos": 12.0,
    "Flashcards": 6.0,
    "Practice": 6.0,
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProfileHeader(),
          TabBar(
            controller: _tabController,
            labelColor: Colors.lightBlue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.lightBlue,
            tabs: const [
              Tab(text: 'Stats'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildStatsTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: avatarUrl != null
                ? NetworkImage(avatarUrl!)
                : const AssetImage("assets/avatar.png") as ImageProvider,
          ),
          const SizedBox(height: 8),
          CustomFont(
            text: username,
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

  Widget _buildStatsTab() {
    final activityLabels = studyHoursByActivity.keys.toList();
    final activityData = studyHoursByActivity.values.toList();

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: CustomFont(
              text: "Learning Progress",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: CustomFont(
            text: "Total Study Hours: 42.5 hrs",
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: StudentBarChart(
              data: activityData,
              labels: activityLabels,
            ),
          ),
        ),
      ],
    );
  }
}

class StudentBarChart extends StatelessWidget {
  final List<double> data;
  final List<String> labels;

  const StudentBarChart({super.key, required this.data, required this.labels});

  @override
  Widget build(BuildContext context) {
    final double maxY = data.isNotEmpty ? (data.reduce((a, b) => a > b ? a : b) + 1).toDouble() : 1.0;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY,
        barTouchData: BarTouchData(enabled: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, interval: (maxY / 5).ceilToDouble()),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < labels.length) {
                  return Text(labels[value.toInt()], style: const TextStyle(fontSize: 12));
                }
                return const Text('');
              },
              interval: 1,
            ),
          ),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        barGroups: data.asMap().entries.map((entry) {
          int index = entry.key;
          double value = entry.value;
          return BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: value,
                color: Colors.lightBlue,
                width: 18,
                borderRadius: BorderRadius.circular(6),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
