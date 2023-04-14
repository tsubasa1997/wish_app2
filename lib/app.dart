import 'package:flutter/material.dart';
import 'package:wish_list_app_mk2/ui/welcome_screen.dart';


class AppColor {
  static const brand = Colors.blue;
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.brand,
        appBarTheme: const AppBarTheme(color: AppColor.brand),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.brand),
            shape: MaterialStateProperty.all(const StadiumBorder()),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.brand,
        ),
        // textTheme: Theme.of(context)
        //     .textTheme
        //     .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: const WelcomeScreen(),
    );
  }
}