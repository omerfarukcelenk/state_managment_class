import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:state_managments/feature/login/view/login_view.dart';
import 'package:state_managments/feature/onboard/on_board_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
      theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark),
          scaffoldBackgroundColor: Colors.grey[300],
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromRGBO(11, 23, 84, 1))),
    );
  }
}
