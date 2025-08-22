import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/home/data/db_helper.dart';

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
              child: FutureBuilder(
                future: DatabaseHelper.instance.getMeals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    log('waiting');
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    log('has data');
                    if (snapshot.data!.isEmpty) {
                      return Center(child: Text('no data'));
                    }

                    return ListView.builder(
                      padding: EdgeInsets.symmetric(vertical: 16.w),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 15.w),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: SizedBox(
                                width: 100.w,
                                height: 100.h,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: snapshot.data![index].imageUrl,
                                  placeholder: (context, url) => Container(
                                    width: 100.w,
                                    height: 100.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                        'assets/pngs/meal.png',
                                        width: 100.w,
                                        height: 100.h,
                                        fit: BoxFit.cover,
                                      ),
                                ),
                              ),
                            ),
                            title: Text(snapshot.data![index].name),
                            subtitle: Text(
                              '${snapshot.data![index].calories.toString()} calories',
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
