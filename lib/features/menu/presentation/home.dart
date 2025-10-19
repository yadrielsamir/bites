import 'package:bites/app/theme/app_colors.dart';
import 'package:bites/features/menu/presentation/home_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    const Center(child: Text('🔍 Orders Page')),
    const Center(child: Text('👤 Account Page')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        backgroundColor: AppColors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.uprmGreen,
          letterSpacing: 0.2,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        items: [
          _buildNavItem(
            index: 0,
            outline: 'assets/icons/Outline_Home_Icon.png',
            filled: 'assets/icons/Filled_Home_Icon.png',
            label: 'Home',
          ),
          _buildNavItem(
            index: 1,
            outline: 'assets/icons/Outline_Receipt_Icon.png',
            filled: 'assets/icons/Filled_Receipt_Icon.png',
            label: 'Orders',
          ),
          _buildNavItem(
            index: 2,
            outline: 'assets/icons/Outline_User_Icon.png',
            filled: 'assets/icons/Filled_User_Icon.png',
            label: 'Account',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem({
    required int index,
    required String outline,
    required String filled,
    required String label,
  }) {
    final bool isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      label: label,

      icon: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 0.5.h,
            width: 16.w,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: isSelected ? AppColors.uprmGreen : Colors.transparent,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Image.asset(outline, height: 28),
          SizedBox(height: 1.h),
        ],
      ),
      activeIcon: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 0.5.h,
            width: 16.w,
            margin: const EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              color: AppColors.uprmGreen,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Image.asset(filled, height: 28),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
