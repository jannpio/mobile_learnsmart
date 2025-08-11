import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnsmart_mobile/screens/course_screen/study_technique_screen.dart';
import '/widgets/custom_font.dart';

class ModuleScreen extends StatelessWidget {
  final String courseTitle;

  ModuleScreen({super.key, required this.courseTitle});

  final List<Map<String, dynamic>> modules = [
    {"title": "Introduction to Philippine Criminal Justice System", "unlocked": true},
    {"title": "Revised Penal Code", "unlocked": false},
    {"title": "Municipal Law vs International Law", "unlocked": false},
    {"title": "Criminal Procedure", "unlocked": false},
    {"title": "Human Rights Education", "unlocked": false},
  ];

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
          text: courseTitle,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: ListView.builder(
          itemCount: modules.length,
          itemBuilder: (context, index) {
            final module = modules[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: GestureDetector(
                onTap: module['unlocked']
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => StudyTechniqueScreen(moduleTitle: module['title']),
                          ),
                        );
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        module['unlocked'] ? Icons.check_circle : Icons.lock,
                        color: module['unlocked'] ? Colors.black : Colors.grey,
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: CustomFont(
                          text: module['title'],
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
