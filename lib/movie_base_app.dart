import 'package:flutter/material.dart';
import 'package:movie_base/presentation/screens/home_screen.dart';
import 'package:movie_base/presentation/themes/app_color.dart';
import 'package:movie_base/presentation/themes/theme_text.dart';
import 'package:sizer/sizer.dart';

class MovieBaseApp extends StatelessWidget {
  const MovieBaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movie Base',
        theme: ThemeData(
          primaryColor: AppColor.vulcan,
          scaffoldBackgroundColor: AppColor.vulcan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0.0),
        ),
        home: const HomeScreen(),
      );
    });
  }
}
