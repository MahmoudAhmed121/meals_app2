import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/add_meal/add_meal_screen.dart';
import 'package:meals_app/features/home/home_screen.dart';
import 'package:meals_app/features/profile/profile_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  List<Widget> screens = [HomeScreen(), AddMealScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.backgroundColor,
        unselectedItemColor: AppColor.secondaryColor,
        selectedItemColor: AppColor.primaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svgs/home.svg'),
            label: 'Home',
            activeIcon: SvgPicture.asset('assets/svgs/home_active.svg'),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svgs/add.svg'),
            label: 'Add Meal',

            activeIcon: SvgPicture.asset('assets/svgs/add_active.svg'),
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/svgs/profile.svg'),
            label: 'Profile',
            activeIcon: SvgPicture.asset('assets/svgs/profile_active.svg'),
          ),
        ],
      ),
    );
  }
}
