import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widgets/custom_font.dart';

class RetrievalPracticeScreen extends StatefulWidget {
  final String moduleTitle;
  const RetrievalPracticeScreen({super.key, required this.moduleTitle});

  @override
  State<RetrievalPracticeScreen> createState() => _RetrievalPracticeScreenState();
}

class _RetrievalPracticeScreenState extends State<RetrievalPracticeScreen> {
  String quizLength = "5 questions";
  String questionType = "Mixed";

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
              text: "Retrieval Practice",
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 8.h),
            Text(
              "Actively recall information from memory by answering questions without looking at notes.",
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
                    "Quiz length",
                    quizLength,
                    ["5 questions", "10 questions", "15 questions"],
                    (val) => setState(() => quizLength = val!),
                  ),
                  SizedBox(height: 10.h),
                  _buildDropdown(
                    "Question type",
                    questionType,
                    ["Mixed", "Multiple Choice", "True/False"],
                    (val) => setState(() => questionType = val!),
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
