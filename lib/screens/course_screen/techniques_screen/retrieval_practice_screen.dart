import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnsmart_mobile/widgets/custom_font.dart';

class RetrievalPracticeScreen extends StatelessWidget {
  final String moduleTitle;
  const RetrievalPracticeScreen({super.key, required this.moduleTitle});

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
        title: CustomFont(
          text: "Retrieval Practice",
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFont(
              text: "Answer questions or quizzes from memory to actively pull information from your brain and reinforce learning.",
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: Colors.black54,
            ),
            SizedBox(height: 20.h),
            CustomFont(
              text: "Settings",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 10.h),
            _buildDropdown("Quiz length", ["5 questions", "10 questions", "15 questions"]),
            _buildDropdown("Question type", ["Mixed", "Multiple choice", "True/False"]),
            const Spacer(),
            _buildNavigationButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> options) {
    String selected = options[0];
    return StatefulBuilder(
      builder: (context, setState) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: DropdownButtonFormField<String>(
            value: selected,
            items: options.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (val) => setState(() => selected = val!),
            decoration: InputDecoration(labelText: label, border: OutlineInputBorder()),
          ),
        );
      },
    );
  }

  Widget _buildNavigationButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Back"),
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Next"),
          ),
        ),
      ],
    );
  }
}
