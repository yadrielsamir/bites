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
                SizedBox(height: 6.h),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyTextField(
              title: 'First Name',
              hint: 'Juan',
              icon: Icons.person_outline,
              halfWidth: true,
            ),
            MyTextField(
              title: 'Last Name',
              hint: 'Carlos',
              icon: Icons.person_outline,
              halfWidth: true,
            ),
          ],
        ),
        SizedBox(height: 3.h),
        MyTextField(
          title: 'Email Address',
          hint: 'example@uprm.edu',
          icon: Icons.email_outlined,
        ),
        Align(alignment: Alignment.centerLeft, child: emailWarning()),
        SizedBox(height: 3.h),
        MyTextField(
          title: 'Phone Number',
          hint: '123-456-7890',
          icon: Icons.phone_outlined,
          isPhoneNumber: true,
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

  Widget emailWarning() {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Row(
        children: [
          Icon(Icons.circle, color: AppColors.hintTextColor, size: 10.sp),
          SizedBox(width: 2.w),
          Text(
            'Only @upr.edu email addresses are allowed',
            style: TextStyle(color: AppColors.hintTextColor),
          ),
        ],
      ),
    );
  }
}
