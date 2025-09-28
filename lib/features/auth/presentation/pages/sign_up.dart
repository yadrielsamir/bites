import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:bites/core/widgets/main_buttons.dart';
import 'package:bites/core/widgets/text_field.dart';
import 'package:bites/features/auth/presentation/widgets/bottom_arc_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Column(
        children: [
          BottomArcContainer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Column(
              children: [
                SizedBox(height: 1.h),
                title('Sign Up'),
                SizedBox(height: 22.sp),
                textFields(),
                SizedBox(height: 3.h),
                buttons(),
                SizedBox(height: 4.h),
                bottomText('Already have an account? Sign In'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget title(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    );
  }

  Widget textFields() {
    return Column(
      children: [
        MyTextField(
          title: 'Email Address',
          hint: 'example@uprm.edu',
          icon: Icons.email_outlined,
        ),
        SizedBox(height: 3.h),
        MyTextField(
          title: 'Password',
          hint: 'Enter your password',
          icon: Icons.lock_outlined,
          isPassword: true,
        ),
      ],
    );
  }

  Widget buttons() {
    return Column(
      children: [
        MyButton(
          title: 'Next',
          onTap: () {},
          fillColor: AppColors.uprmGreen,
          borderColor: AppColors.uprmGreen,
          textColor: AppColors.white,
        ),
      ],
    );
  }

  Widget bottomText(String text) {
    return CupertinoButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.uprmGreen,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.uprmGreen,
          decorationThickness: 0.6,
        ),
      ),
    );
  }
}
