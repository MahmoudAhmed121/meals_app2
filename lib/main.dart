import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/app_constant.dart';
import 'package:meals_app/features/home/product_details_screen.dart';
import 'package:meals_app/features/home_layout/home_layout_screen.dart';
import 'package:meals_app/features/onboarding/onboarding_screen.dart';
import 'package:meals_app/features/onboarding/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('ar'),
      child: MyApp(),
    ),
  );
  // Person person = Person('mahmoud', 25, 'mahmoud@gmail.com');
  // Person ali = Person('ali', 20, 'ali@gmail.com');
  // Person ahmed = Person('ahmed', 22, 'ahmed@gmail.com');

  // person.printMyData();
  // ali.printMyData();
  // ahmed.printMyData();
}

// class Person {
//   final String name;
//   final int age;
//   final String email;

//   Person(this.name, this.age, this.email);

//   void printMyData() {
//     debugPrint('my name is $name and my age is $age and my email is $email');
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          routes: {
            splash: (_) => SplashScreen(),
            onboarding: (_) => OnboardingScreen(),
            homeLayout: (_) => HomeLayoutScreen(),
          
          },
        );
      },
    );
  }
}
