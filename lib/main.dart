import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnsmart_mobile/screens/main_screen/main_navigation_screen.dart';
import '/screens/account_screen/signup_screen.dart';
import '/screens/account_screen/login_screen.dart';
import '/screens/account_screen/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const LearnSmart());
}

class LearnSmart extends StatelessWidget {
  const LearnSmart({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Learn Smart',
          initialRoute: '/',

          routes: {
            '/': (context) => StartScreen(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => const SignupScreen(),
            '/home': (context) => const MainNavigationScreen(), 
          },
        );
      },
    );
  }
}
