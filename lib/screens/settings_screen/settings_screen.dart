import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '/widgets/custom_font.dart';
import '/widgets/custom_inkwell_button.dart';
import '/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? avatarFile;
  final _usernameController = TextEditingController(text: 'demo_user');
  final _emailController = TextEditingController(text: 'user@example.com');
  final _passwordController = TextEditingController();

  bool notif = true;
  bool ads = false;
  bool emailNotif = true;
  bool notif1 = true;
  bool notif2 = false;
  bool notif3 = true;

  void pickAvatarFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      setState(() {
        avatarFile = File(result.files.single.path!);
      });
    }
  }

  void showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void confirmDelete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to permanently delete your account?"),
        actions: [
          CustomInkwellButton(
            onTap: () => Navigator.pop(context),
            height: 40,
            width: 100,
            buttonName: "Cancel",
            bgColor: Colors.grey.shade300,
            fontColor: Colors.black,
          ),
          CustomInkwellButton(
            onTap: () {
              Navigator.pop(context);
              showSnack("Account deleted (mock)");
            },
            height: 40,
            width: 100,
            buttonName: "Delete",
            bgColor: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildTextInput(String label, TextEditingController controller, String fieldName, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: isPassword,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CustomInkwellButton(
            onTap: () => showSnack('$fieldName updated (mock)'),
            height: 40,
            width: 80,
            buttonName: "Change",
          ),
        ],
      ),
    );
  }

  Widget _buildSwitch(String label, bool value, Function(bool) onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomFont(text: label, fontSize: 16, color: Colors.black),
        Switch(value: value, onChanged: onChanged, activeColor: Colors.blue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),
      appBar: AppBar(
        title: const CustomFont(
          text: "Settings",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: avatarFile != null
                        ? FileImage(avatarFile!)
                        : const AssetImage('assets/avatars.png') as ImageProvider,
                  ),
                  const SizedBox(height: 10),
                  CustomInkwellButton(
                    onTap: pickAvatarFile,
                    height: 40,
                    width: 160,
                    buttonName: "Choose Image",
                    bgColor: Colors.grey.shade200,
                    fontColor: Colors.black,
                  ),
                  const SizedBox(height: 8),
                  CustomInkwellButton(
                    onTap: () => showSnack("Profile picture updated (mock)"),
                    height: 40,
                    width: 200,
                    buttonName: "Change Profile Picture",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            _buildTextInput("Username", _usernameController, 'Username'),
            _buildTextInput("Email", _emailController, 'Email'),
            _buildTextInput("Password", _passwordController, 'Password', isPassword: true),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            const Align(
              alignment: Alignment.centerLeft,
              child: CustomFont(
                text: "Website Notifications",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            _buildSwitch("Enable notifications", notif, (v) => setState(() => notif = v)),
            _buildSwitch("Enable advertisements", ads, (v) => setState(() => ads = v)),
            _buildSwitch("Enable email notifications", emailNotif, (v) => setState(() => emailNotif = v)),
            CustomInkwellButton(
              onTap: () => showSnack("Website notification settings saved (mock)"),
              height: 40,
              width: 120,
              buttonName: "Save",
              bgColor: Colors.green,
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),

            const Align(
              alignment: Alignment.centerLeft,
              child: CustomFont(
                text: "Email Notifications",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            _buildSwitch("Quiz result updates", notif1, (v) => setState(() => notif1 = v)),
            _buildSwitch("Course updates", notif2, (v) => setState(() => notif2 = v)),
            _buildSwitch("New quizzes", notif3, (v) => setState(() => notif3 = v)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomInkwellButton(
                  onTap: () => showSnack("Email notification settings saved (mock)"),
                  height: 40,
                  width: 120,
                  buttonName: "Save",
                  bgColor: Colors.green,
                ),
                CustomInkwellButton(
                  onTap: confirmDelete,
                  height: 45,
                  width: 180,
                  buttonName: "Delete Account",
                  bgColor: Colors.red,
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(),
            Center(
              child: CustomInkwellButton(
                onTap: () => showSnack("Logged out (mock)"),
                height: 40,
                width: 120,
                buttonName: "Logout",
                bgColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
