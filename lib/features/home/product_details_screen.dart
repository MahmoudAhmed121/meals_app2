import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/home/data/meal_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.mealModel});

  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(mealModel.name)),
      body: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width,
              height: 250.h,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: mealModel.imageUrl,
                placeholder: (context, url) => Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/pngs/meal.png',
                  width: 100.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Text(mealModel.name),
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColor.primaryColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Icon(Icons.timer_outlined, color: AppColor.primaryColor),
                  SizedBox(width: 10.w),
                  Text(mealModel.time),
                  Spacer(),
                  Icon(Icons.timer_outlined, color: AppColor.primaryColor),
                  SizedBox(width: 10.w),
                  Text(mealModel.time),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Text(mealModel.description),
          ],
        ),
      ),
    );
  }
}
