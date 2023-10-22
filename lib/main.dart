import 'package:flutter/material.dart';
import 'package:news/layout/home.dart';
import 'package:news/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),
      },
    );
  }
}


