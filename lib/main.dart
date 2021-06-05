import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/constants.dart';
import 'package:flutter_ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter UI',
          theme: ThemeData(
            fontFamily: "Cairo",
            scaffoldBackgroundColor: kBackgroundColor,
            textTheme:
                Theme.of(context).textTheme.apply(displayColor: kTextColor),
          ),
          home: HomeScreen(),
        );
      },
    );
  }
}
