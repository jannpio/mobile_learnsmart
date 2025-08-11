import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants.dart';
import '/widgets/custom_font.dart';
import '/widgets/custom_inkwell_button.dart';
import '/widgets/custom_textformfield.dart';
import '/widgets/custom_dialog.dart';
import '../account_screen/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool isLoading = false;
  bool agreeToTerms = false;

  @override
  void dispose() {
    _fullname.dispose();
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  void _fakeRegister() async {
    if (!_formKey.currentState!.validate()) return;

    if (!agreeToTerms) {
      customDialog(
        context,
        title: "Agreement Required",
        content: "You must agree to the terms and conditions to proceed.",
      );
      return;
    }

    if (_password.text != _confirmPassword.text) {
      customDialog(
        context,
        title: "Error",
        content: "Passwords do not match.",
      );
      return;
    }

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    customDialog(
      context,
      title: "Success",
      content: "Account registration successful!",
      onConfirm: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      },
    );
  }

  void _showTermsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CustomFont(
          text: 'Terms and Conditions',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        content: SingleChildScrollView(
          child: CustomFont(
            text:
                'Welcome to LearnSmart!\n\n'
                'By creating an account, you agree to the following terms:\n\n'
                '1. Use of Service: You agree to use LearnSmart only for lawful educational purposes.\n'
                '2. Privacy: Your data will be protected and handled according to our privacy policy.\n'
                '3. Content Ownership: All course materials are protected by copyright laws.\n'
                '4. User Conduct: Harassment, cheating, or misuse of the platform is prohibited.\n'
                '5. Account Termination: Violation of these terms may result in account suspension or termination.\n\n'
                'Please make sure you have read and understood all the terms before proceeding.\n\n'
                'Thank you for choosing LearnSmart!',
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
            textAlign: TextAlign.justify,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: CustomFont(
              text: 'Close',
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: BG_PRIMARY,
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: ScreenUtil().screenHeight,
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 100.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFont(
                  text: 'Sign Up',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                CustomFont(
                  text: 'Create an account to continue',
                  fontSize: 13.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black45,
                ),
                SizedBox(height: 30.h),
                CustomTextFormField(
                  height: 20.h,
                  width: 360.w,
                  controller: _fullname,
                  hintText: 'Enter your full name',
                  prefixIcon: const Icon(Icons.person),
                  fontSize: 15.sp,
                  hintTextSize: 13.sp,
                  fontColor: Colors.black,
                  onSaved: (val) {},
                  validator: (val) => val == null || val.trim().isEmpty
                      ? 'Full name is required'
                      : null,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  height: 20.h,
                  width: 360.w,
                  controller: _email,
                  hintText: 'Enter your email',
                  prefixIcon: const Icon(Icons.email),
                  fontSize: 15.sp,
                  hintTextSize: 13.sp,
                  fontColor: Colors.black,
                  onSaved: (val) {},
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(val.trim())) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  height: 20.h,
                  width: 360.w,
                  controller: _password,
                  hintText: 'Enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  isObscure: true,
                  fontSize: 15.sp,
                  hintTextSize: 13.sp,
                  fontColor: Colors.black,
                  onSaved: (val) {},
                  validator: (val) =>
                      val == null || val.length < 6 ? 'Minimum 6 characters required' : null,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  height: 20.h,
                  width: 360.w,
                  controller: _confirmPassword,
                  hintText: 'Re-enter your password',
                  prefixIcon: const Icon(Icons.lock),
                  isObscure: true,
                  fontSize: 15.sp,
                  hintTextSize: 13.sp,
                  fontColor: Colors.black,
                  onSaved: (val) {},
                  validator: (val) => val != _password.text ? 'Passwords do not match' : null,
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Checkbox(
                      value: agreeToTerms,
                      onChanged: (val) => setState(() => agreeToTerms = val!),
                      activeColor: BG_PRIMARY,
                    ),
                    Expanded(
                      child: Wrap(
                        children: [
                          GestureDetector(
                            onTap: () => setState(() => agreeToTerms = !agreeToTerms),
                            child: CustomFont(
                              text: "I agree to the ",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: _showTermsDialog,
                            child: CustomFont(
                              text: "terms and conditions",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: BG_PRIMARY,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Center(
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : CustomInkwellButton(
                          onTap: _fakeRegister,
                          height: 35.h,
                          width: 200.w,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          buttonName: 'Sign Up',
                        ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomFont(
                      text: "Already have an account? ",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                      child: CustomFont(
                        text: 'Login here',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: BG_PRIMARY,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
