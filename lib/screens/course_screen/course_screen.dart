import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widgets/custom_font.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  final List<Map<String, dynamic>> courses = const [
    {"title": "Criminal Jurisprudence and Procedure", "color": Colors.blueGrey},
    {"title": "Law Enforcement Administration", "color": Colors.cyan},
    {"title": "Crime Detection and Investigation", "color": Colors.indigo},
    {"title": "Criminalistics", "color": Colors.teal},
    {"title": "Correctional Administration", "color": Colors.purple},
    {"title": "Criminology", "color": Colors.blueGrey},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF8FAFC),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomFont(
            text: "Courses",
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 40.h),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: SizedBox(
                    height: 70.h, 
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Row(
                        children: [
                          Container(
                            height: 40.h,
                            width: 40.h,
                            decoration: BoxDecoration(
                              color: course['color'],
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          SizedBox(width: 16.w),
                          Expanded(
                            child: CustomFont(
                              text: course['title'],
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
        ],
      ),
    );
  }
}
