import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/screens/account_screen/signup_screen.dart';
import '/widgets/custom_font.dart';
import '/widgets/custom_textformfield.dart';
import '/widgets/custom_inkwell_button.dart';
import '/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  void _fakeLogin() {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() => isLoading = false);

      // ✅ Navigate to MainNavigationScreen with the bottom nav bar
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: ScreenUtil().screenHeight,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 150.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFont(
                  text: 'Welcome!',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                CustomFont(
                  text: 'Login an account to continue',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
                SizedBox(height: 40.h),
                CustomTextFormField(
                  height: 20.h,
                  width: 360.w,
                  controller: _emailController,
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  fontSize: 15.sp,
                  hintTextSize: 13.sp,
                  fontColor: Colors.black,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) return 'Email is required';
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (val) {},
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  height: 20.h,
                  width: 360.w,
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  isObscure: true,
                  fontSize: 15.sp,
                  hintTextSize: 13.sp,
                  fontColor: Colors.black,
                  validator: (val) =>
                      val == null || val.length < 6 ? 'Minimum 6 characters required' : null,
                  onSaved: (val) {},
                ),
                SizedBox(height: 20.h),
                Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : CustomInkwellButton(
                          onTap: _fakeLogin,
                          height: 35.h,
                          width: 200.w,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          buttonName: 'Login',
                        ),
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFont(
                      text: "Don't have an account? ",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const SignupScreen()),
                        );
                      },
                      child: CustomFont(
                        text: 'Sign up here',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: BG_PRIMARY,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
