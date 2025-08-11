import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widgets/custom_font.dart';
import '/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                text: "Welcome, [name]!",
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              CustomFont(
                text: "Ready to conquer your studies today?",
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
              SizedBox(height: 20.h),

              // Study Plan
              CustomFont(
                text: "Today's Study Plan",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              CustomFont(
                text: "Retrieval Practice - Criminalistics Module 2\nGoal: Review 10 Flashcards",
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: BG_PRIMARY,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  child: CustomFont(
                    text: "Start Session",
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 25.h),

              // Quick Stats
              CustomFont(
                text: "Quick Stats",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _statCard("Consistency", "5 days\nthis week"),
                  _statCard("Total Time", "This week\n0h 41 mins"),
                  _statCard("Top Technique", "Spaced\nRepetition"),
                ],
              ),
              SizedBox(height: 25.h),

              // Learning Path
              CustomFont(
                text: "Learning Path",
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              CustomFont(
                text: "Continue where you left off",
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black54,
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: CustomFont(
                        text: "Criminal Jurisprudence and Procedure\nModule 3",
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String title, String value) {
    return Container(
      width: 100.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: [
          CustomFont(
            text: title,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 5.h),
          CustomFont(
            text: value,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
            color: Colors.black54,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
