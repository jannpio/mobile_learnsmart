import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnsmart_mobile/widgets/custom_font.dart';
import 'package:learnsmart_mobile/screens/course_screen/techniques_screen/active_recall_screen.dart';
import 'package:learnsmart_mobile/screens/course_screen/techniques_screen/pomodoro_screen.dart';
import 'package:learnsmart_mobile/screens/course_screen/techniques_screen/feynman_screen.dart';
import 'package:learnsmart_mobile/screens/course_screen/techniques_screen/retrieval_practice_screen.dart';

class StudyTechniqueScreen extends StatefulWidget {
  final String moduleTitle;
  const StudyTechniqueScreen({super.key, required this.moduleTitle});

  @override
  State<StudyTechniqueScreen> createState() => _StudyTechniqueScreenState();
}

class _StudyTechniqueScreenState extends State<StudyTechniqueScreen> {
  int? selectedIndex;

  final List<Map<String, String>> techniques = [
    {
      "title": "Active Recall",
      "desc": "Test yourself frequently without looking at your notes to strengthen memory and understanding."
    },
    {
      "title": "Pomodoro Technique",
      "desc": "Study in short focused bursts (e.g., 25 minutes) followed by a 5-minute break to improve concentration."
    },
    {
      "title": "Feynman Technique",
      "desc": "Explain the topic in your own words, as if teaching someone else, to deepen comprehension."
    },
    {
      "title": "Retrieval Practice",
      "desc": "Answer questions or quizzes from memory to actively pull information from your brain and reinforce learning."
    },
  ];

  void _navigateToTechnique(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ActiveRecallScreen(moduleTitle: widget.moduleTitle),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PomodoroScreen(moduleTitle: widget.moduleTitle),
          ),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FeynmanScreen(moduleTitle: widget.moduleTitle),
          ),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RetrievalPracticeScreen(moduleTitle: widget.moduleTitle),
          ),
        );
        break;
    }
  }

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
          text: "Select a study technique",
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: techniques.length,
                itemBuilder: (context, index) {
                  final tech = techniques[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.cyan
                                : Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Radio<int>(
                              value: index,
                              groupValue: selectedIndex,
                              onChanged: (val) {
                                setState(() {
                                  selectedIndex = val;
                                });
                              },
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomFont(
                                    text: tech['title']!,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    tech['desc']!,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedIndex != null
                    ? () => _navigateToTechnique(selectedIndex!)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                child: CustomFont(
                  text: "Continue",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
