import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/add_meal/add_meal_screen.dart';
import 'package:meals_app/features/home/home_screen.dart';
import 'package:meals_app/features/profile/profile_screen.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({super.key});

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  
  List<Widget> screens = [
    const HomeScreen(),
    const AddMealScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      backgroundColor: AppColor.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroundColor,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: AppColor.secondaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            activeIcon: SvgPicture.asset('assets/svgs/home_active.svg'),
            icon: SvgPicture.asset('assets/svgs/home.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Add Meal',
            activeIcon: SvgPicture.asset('assets/svgs/add_active.svg'),
            icon: SvgPicture.asset('assets/svgs/add.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            activeIcon: SvgPicture.asset('assets/svgs/profile_active.svg'),
            icon: SvgPicture.asset('assets/svgs/profile.svg'),
          ),
        ],
      ),
    );
  }
}
