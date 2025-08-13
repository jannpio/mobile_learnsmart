import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnsmart_mobile/widgets/custom_font.dart';

class FeynmanScreen extends StatelessWidget {
  final String moduleTitle;
  const FeynmanScreen({super.key, required this.moduleTitle});

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
          text: "Feynman Technique",
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
              text: "Explain the topic in your own words, as if teaching someone else, to deepen comprehension.",
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
            _buildDropdown("Focus time", ["25 mins", "30 mins", "45 mins"]),
            _buildDropdown("Text box", ["Enabled", "Disabled"]),
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
