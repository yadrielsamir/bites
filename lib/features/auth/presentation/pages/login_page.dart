import 'package:bites/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:bites/features/auth/presentation/widgets/bottom_arc_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Column(
        children: [
          BottomArcContainer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Column(
              children: [
                title('Sign In'),
                SizedBox(height: 20.h),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
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
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.black,
      ),
    );
  }
}
