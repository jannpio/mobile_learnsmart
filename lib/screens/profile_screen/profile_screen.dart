import 'package:flutter/material.dart';
import '/widgets/custom_font.dart';
import '/screens/settings_screen/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7FAFF),
        elevation: 0,
        centerTitle: false,
        title: const CustomFont(
          text: "Profile",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar with edit icon
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/avatar.png"),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.camera_alt,
                        size: 18, color: Colors.white),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const CustomFont(
              text: "Username",
              fontSize: 16,
              color: Colors.black,
            ),
            const SizedBox(height: 30),

            // Personalized Recommendations
            _sectionTitle("Personalized Recommendations"),
            const SizedBox(height: 10),
            _infoCard(
              icon: Icons.circle,
              iconColor: Colors.blue,
              text:
                  "Increase the use of spaced repetition over the next few days to better consolidate your learning",
            ),
            const SizedBox(height: 10),
            _infoCard(
              icon: Icons.circle,
              iconColor: Colors.blue,
              text:
                  "You tend to study late at night — consider a shorter session in the morning for retention.",
            ),
            const SizedBox(height: 30),

            // Strengths
            _sectionTitle("Strengths"),
            const SizedBox(height: 10),
            _infoCard(
              icon: Icons.check_circle,
              iconColor: Colors.green,
              text:
                  "Your active recall performance has continually improved.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: CustomFont(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required Color iconColor,
    required String text,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: CustomFont(
              text: text,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
