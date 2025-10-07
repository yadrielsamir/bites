import 'package:animations/animations.dart';
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
  int currentPage = 0;
  int direction = 1; // 1 = forward, -1 = back

  Future<void> nextPage() async {
    if (currentPage < 1) {
      setState(() {
        direction = 1;
        currentPage++;
      });
    } else {
      context.push('/splash/terms_and_conditions');
    }
  }

  Future<void> prevPage() async {
    if (currentPage > 0) {
      setState(() {
        direction = -1;
        currentPage--;
      });
    }
  }

  final List<String> passwordRules = [
    'Minimum 8 characters',
    'Contains uppercase and lowercase letters',
    'Contains at least one number',
    'Contains at least one special character',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: Column(
        children: [
          BottomArcContainer(),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0.5.h),
                  title('Sign Up'),
                  SizedBox(height: 2.h),
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return PageTransitionSwitcher(
                          duration: const Duration(milliseconds: 300),
                          reverse: direction == -1,
                          transitionBuilder: (child, primary, secondary) =>
                              SharedAxisTransition(
                                animation: primary,
                                secondaryAnimation: secondary,
                                transitionType:
                                    SharedAxisTransitionType.horizontal,
                                fillColor: Colors.transparent,
                                child: child,
                              ),
                          child: KeyedSubtree(
                            key: ValueKey<int>(currentPage),
                            child: SizedBox(
                              height: constraints.maxHeight,
                              width: double.infinity,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: SingleChildScrollView(
                                  physics: const BouncingScrollPhysics(),
                                  padding: EdgeInsets.only(bottom: 12),
                                  child: currentPage == 0
                                      ? firstPage()
                                      : secondPage(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Button pinned to bottom (consistent position)
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.sm,
            0,
            AppSpacing.sm,
            AppSpacing.sm,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(
                title: 'Next',
                onTap: nextPage,
                fillColor: AppColors.uprmGreen,
                borderColor: AppColors.uprmGreen,
                textColor: AppColors.white,
              ),
              SizedBox(height: 2.h),
              bottomText(),
            ],
          ),
        ),
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

  Widget firstPageTextFields() {
    return Column(
      key: ValueKey(0),
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
          hint: 'example@upr.edu',
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

  Widget secondPageTextFields() {
    return Column(
      key: ValueKey(1),
      children: [
        MyTextField(
          title: 'Password',
          hint: 'Enter password',
          icon: Icons.lock_outlined,
          isPassword: true,
        ),
        SizedBox(height: 1.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: passwordRules.map((rule) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 20,
                    color: AppColors.hintTextColor,
                  ),
                  const SizedBox(width: 8),
                  Text(rule, style: TextStyle(color: AppColors.hintTextColor)),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 3.h),
        MyTextField(
          title: 'Confirm Password',
          hint: 'Enter password again',
          icon: Icons.lock_outlined,
          isPassword: true,
        ),
      ],
    );
  }

  Widget nextButton() {
    return Column(
      children: [
        MyButton(
          title: 'Next',
          onTap: () {
            nextPage();
          },
          fillColor: AppColors.uprmGreen,
          borderColor: AppColors.uprmGreen,
          textColor: AppColors.white,
        ),
      ],
    );
  }

  Widget bottomText() {
    return CupertinoButton(
      onPressed: () {
        context.pop();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.hintTextColor,
            ),
          ),
          SizedBox(width: 1.w),
          Text(
            'Sign in',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.uprmGreen,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.uprmGreen,
              decorationThickness: 0.6,
            ),
          ),
        ],
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

  Widget firstPage() {
    return Column(children: [firstPageTextFields()]);
  }

  Widget secondPage() {
    return Column(children: [secondPageTextFields()]);
  }
}
