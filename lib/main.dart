import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
}

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
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void changeLanguage() {
    if (context.locale == Locale('en')) {
      context.setLocale(Locale('ar'));
    } else {
      context.setLocale(Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    print('------build------');
    return Scaffold(
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.locale.toString(), style: TextStyle(fontSize: 30.sp)),

            Text('hello'.tr(), style: TextStyle(fontSize: 30.sp)),

            Text('my_meals'.tr(), style: TextStyle(fontSize: 30.sp)),

            Text('test'.tr(), style: TextStyle(fontSize: 30.sp)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeLanguage,
        child: const Icon(Icons.language),
      ),
    );
  }
}



// SizedBox(
//         width: size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             isNetworkImage == true
//                 ? Image.network(
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXZylLZLdEOnpA7xCFv_tEqFvcThCY70wK7Q&s',
//                   )
//                 : Image.asset('assets/pngs/food.jpg'),
//             SizedBox(height: 50.h),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   isNetworkImage = !isNetworkImage;
//                 });

//                 print('isNetworkImage: $isNetworkImage');
//               },
//               child: Text('convert'),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {});
//               },
//               child: Text('test button'),
//             ),
//           ],
//         ),
//       ),
   