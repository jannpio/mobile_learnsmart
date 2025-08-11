import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/constants.dart';
import '/widgets/custom_font.dart';
import '/widgets/custom_textformfield.dart';
import '/widgets/custom_inkwell_button.dart';
import '/widgets/custom_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future<void> _resetPassword() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 2));

    customDialog(
      context,
      title: 'Check Your Email',
      content:
          'A password reset link has been sent to ${_emailController.text.trim()} (simulated)',
    );

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG_SECONDARY,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Image.asset(
                  'assets/images/password.png',
                  height: 150,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20.h),
                CustomFont(
                  text: 'Forgot Password?',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  controller: _emailController,
                  hintText: 'Enter your email',
                  fontSize: 14.sp,
                  hintTextSize: 12.sp,
                  width: 350.w,
                  height: 45.h,
                  fontColor: Colors.black,
                  prefixIcon: const Icon(Icons.email),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {},
                ),
                SizedBox(height: 20.h),
                isLoading
                    ? const CircularProgressIndicator()
                    : CustomInkwellButton(
                        onTap: _resetPassword,
                        height: 20.h,
                        width: 150.w,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        buttonName: 'Reset Password',
                        bgColor: BG_PRIMARY,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
