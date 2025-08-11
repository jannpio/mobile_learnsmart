import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants.dart';
import '../account_screen/login_screen.dart';
import '../account_screen/signup_screen.dart';
import '/widgets/custom_inkwell_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView( 
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 200,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  child: Image(
                    image: AssetImage("assets/logo/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome to LearnSmart!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Your smart study companion. Learn efficiently, track your growth, and stay exam-ready.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 30),
              CustomInkwellButton(
                buttonName: 'Login',
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                width: 250.w,
                height: 35.h,
                onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
              ),
              const SizedBox(height: 10),
              SizedBox(
              width: 250.w,
              height: 35.h,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: BG_PRIMARY, width: 2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () { 
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupScreen()),
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: BG_PRIMARY,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}
