import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_color.dart';
import 'package:meals_app/features/home/data/db_helper.dart';
import 'package:meals_app/features/home/data/meal_model.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key});

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final TextEditingController mealController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final DatabaseHelper databaseHelper = DatabaseHelper.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        surfaceTintColor: AppColor.backgroundColor,
        centerTitle: true,
        title: Text('add_meal'.tr()),
      ),
      body: SizedBox(
        width: size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('meal_name'.tr()),
                  CustomTextField(
                    controller: mealController,
                    validator: (text) {
                      if (text!.isEmpty && text.length < 3) {
                        return 'This field is required or must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.h),
                  Text('image_url'.tr()),
                  CustomTextField(
                    maxLines: 3,
                    controller: imageUrlController,
                    validator: (text) {
                      if (text!.isEmpty && text.length < 3) {
                        return 'This field is required or must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.h),
                  Text('rate'.tr()),
                  CustomTextField(
                    keyboardType: TextInputType.number,
                    controller: rateController,
                    validator: (text) {
                      if (text!.isEmpty && text.length < 3) {
                        return 'This field is required or must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.h),
                  Text('time'.tr()),
                  CustomTextField(
                    controller: timeController,
                    validator: (text) {
                      if (text!.isEmpty && text.length < 3) {
                        return 'This field is required or must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.h),
                  Text('calories'.tr()),
                  CustomTextField(
                    controller: caloriesController,
                    keyboardType: TextInputType.number,
                    validator: (text) {
                      if (text!.isEmpty && text.length < 3) {
                        return 'This field is required or must be at least 3 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 5.h),
                  Text('description'.tr()),
                  CustomTextField(
                    maxLines: 4,
                    controller: descriptionController,
                    validator: (text) {
                      if (text!.isEmpty && text.length < 3) {
                        return 'This field is required or must be at least 3 characters';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 52.h,
                    width: size.width,
                    child: IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          MealModel meal = MealModel(
                            name: mealController.text,
                            imageUrl: imageUrlController.text,
                            description: descriptionController.text,
                            calories: double.parse(caloriesController.text),
                            time: timeController.text,
                            rate: double.parse(rateController.text),
                          );

                          databaseHelper.insertMeal(meal).then((_) {
                            mealController.clear();
                            imageUrlController.clear();
                            descriptionController.clear();
                            caloriesController.clear();
                            timeController.clear();
                            rateController.clear();
                          });
                        }
                      },
                      icon: Text('save'.tr()),
                    ),
                  ),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.maxLines,
    this.hintText,
    this.maxLength,
    required this.controller,
    this.keyboardType,
    this.validator,
  });

  final int? maxLines;
  final String? hintText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      validator: validator,
      keyboardType: keyboardType,

      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
        hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
