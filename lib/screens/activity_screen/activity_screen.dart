import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widgets/custom_font.dart';
import '/constants.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_SECONDARY,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFont(
                text: "Recent Activity",
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 20.h),
              CustomFont(
                text: "You completed a study session on Criminalistics Module 2.",
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
              SizedBox(height: 10.h),
              CustomFont(
                text: "You achieved a new streak of 5 days!",
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
            ],
          ),
        ),
        ));
  }
}
