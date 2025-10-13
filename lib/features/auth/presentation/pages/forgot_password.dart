import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/app/theme/app_spacing.dart';
import 'package:bites/core/widgets/main_buttons.dart';
import 'package:bites/core/widgets/text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xxl,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppSpacing.md,
                bottom: AppSpacing.sm,
              ),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                minimumSize: Size(0, 0),
                onPressed: () {
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.uprmGreen,
                  size: 22.sp,
                ),
              ),
            ),
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            Text(
              'Enter your email address and we’ll send you a link to reset your password. If you don’t see it within a few minutes, check your spam or junk folder.',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.hintTextColor,
              ),
            ),
            SizedBox(height: 2.h),
            MyTextField(
              title: 'Email Address',
              hint: 'example@uprm.edu',
              icon: Icons.email_outlined,
              hideTitle: true,
            ),
            SizedBox(height: 2.h),
            MyButton(
              title: 'Confirm',
              onTap: () {},
              fillColor: AppColors.uprmGreen,
              borderColor: AppColors.uprmGreen,
              textColor: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
