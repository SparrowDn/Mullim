import 'package:flutter/material.dart';
import 'package:mullim/login/SigninPage.dart';
import 'package:mullim/pages/LoadingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mullim/pages/HomePage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primaryColor: Colors.white, // 테마가 흰색으로 설정됨.
      //   primarySwatch: Colors.blue,
      //   appBarTheme: AppBarTheme(
      //     backgroundColor: Colors.white,
      //     titleTextStyle: TextStyle(
      //       color: Colors.black,
      //     ),
      //     iconTheme: IconThemeData(
      //       color: Colors.black,
      //     ),
      //   ),
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      home: LoadingPage(),
    );
  }
}
