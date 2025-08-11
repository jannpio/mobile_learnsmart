import 'package:flutter/material.dart';
import 'package:learnsmart_mobile/screens/activity_screen/activity_screen.dart';
import '/screens/home_screen/home_screen.dart';
import '/screens/course_screen/course_screen.dart';
import '../tracker_screen/tracker_screen.dart';
import '/screens/activity_screen/activity_screen.dart';
import '/screens/profile_screen/profile_screen.dart';
import '/widgets/custom_navbar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    CourseScreen(),
    TrackerScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
