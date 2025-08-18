import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int padgeIndex = 0;
  List<String> images = [
    'assets/pngs/one.png',
    'assets/pngs/two.png',
    'assets/pngs/three.png',
  ];


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.3,
                disableCenter: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  debugPrint('my padge index: $index');
                  setState(() {
                    padgeIndex = index;
                  });
                },
              ),
              items: List.generate(images.length, (index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      images[index],
                      width: size.width,
                      height: size.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 20.h,
                      child: DotsIndicator(
                        dotsCount: images.length,
                        position: padgeIndex.toDouble(),

                        decorator: DotsDecorator(
                          size: Size(20.w, 8.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          color: Colors.grey,
                          activeSize: Size(20.w, 8.h),
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          activeColor: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  Text(
                    'my_meals'.tr(),
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.w),
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 15.w),
                    child: ListTile(
                      leading: Image.asset(
                        'assets/pngs/meal.png',
                        width: 70.w,
                        height: 70.h,
                      ),
                      title: Text('Breakfast Smoothie'),
                      subtitle: Text('350 calories'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Row(
//                       children: [
//                         Image.asset(
//                           'assets/pngs/meal.png',
//                           width: 70.w,
//                           height: 70.h,
//                         ),
//                         SizedBox(width: 15.w),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Breakfast Smoothie',
//                               style: TextStyle(
//                                 color: AppColor.secondaryColor,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                             Text(
//                               '350 calories',
//                               style: TextStyle(
//                                 color: AppColor.primaryColor,
//                                 fontSize: 14.sp,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
