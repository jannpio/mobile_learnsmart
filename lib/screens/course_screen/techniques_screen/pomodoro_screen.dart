import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widgets/custom_font.dart';

class PomodoroScreen extends StatefulWidget {
  final String moduleTitle;
  const PomodoroScreen({super.key, required this.moduleTitle});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  String focusTime = "25 mins";
  String shortBreak = "5 mins";
  String sessions = "4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFont(
              text: "Pomodoro",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 8.h),
            Text(
              "Study in short focused bursts followed by short breaks to improve concentration and reduce fatigue.",
              style: TextStyle(fontSize: 13.sp, color: Colors.black54),
            ),
            SizedBox(height: 20.h),

            CustomFont(
              text: "Settings",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 10.h),

            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF1F5),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  _buildDropdown(
                    "Focus time",
                    focusTime,
                    ["15 mins", "20 mins", "25 mins", "30 mins"],
                    (val) => setState(() => focusTime = val!),
                  ),
                  SizedBox(height: 10.h),
                  _buildDropdown(
                    "Short break",
                    shortBreak,
                    ["3 mins", "5 mins", "7 mins"],
                    (val) => setState(() => shortBreak = val!),
                  ),
                  SizedBox(height: 10.h),
                  _buildDropdown(
                    "Sessions",
                    sessions,
                    ["2", "3", "4", "5"],
                    (val) => setState(() => sessions = val!),
                  ),
                ],
              ),
            ),

            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: _buildButton("Back", Colors.grey.shade300, Colors.black, () {
                    Navigator.pop(context);
                  }),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: _buildButton("Next", Colors.lightBlue, Colors.white, () {
                    // Navigate to next step
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, String value, List<String> items, ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.r), borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.white,
      ),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, VoidCallback onPressed) {
    return SizedBox(
      height: 45.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(text, style: TextStyle(color: textColor, fontSize: 14.sp)),
      ),
    );
  }
}
