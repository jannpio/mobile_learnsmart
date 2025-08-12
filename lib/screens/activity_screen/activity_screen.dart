import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/widgets/custom_font.dart';
import '/constants.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  final List<_ActivityItem> activities = const [
    _ActivityItem(
      icon: Icons.book,
      title: "Completed study session",
      description: "Criminalistics Module 2",
      time: "2 hours ago",
      color: Color(0xFF0073FF),
    ),
    _ActivityItem(
      icon: Icons.local_fire_department,
      title: "New streak achieved",
      description: "5 days in a row",
      time: "Yesterday",
      color: Colors.orange,
    ),
    _ActivityItem(
      icon: Icons.quiz,
      title: "Finished quiz",
      description: "Forensic Science Basics",
      time: "2 days ago",
      color: Colors.green,
    ),
  ];

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
              ...activities.map((activity) => _buildActivityCard(activity)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard(_ActivityItem activity) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      margin: EdgeInsets.only(bottom: 14.h),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(14.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon circle
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: activity.color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                activity.icon,
                color: activity.color,
                size: 22.sp,
              ),
            ),
            SizedBox(width: 12.w),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFont(
                    text: activity.title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  SizedBox(height: 4.h),
                  CustomFont(
                    text: activity.description,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 12.sp, color: Colors.grey),
                      SizedBox(width: 4.w),
                      CustomFont(
                        text: activity.time,
                        fontSize: 11.sp,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActivityItem {
  final IconData icon;
  final String title;
  final String description;
  final String time;
  final Color color;

  const _ActivityItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.time,
    required this.color,
  });
}
