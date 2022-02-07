import 'package:animated_login_page/screens/login_page.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.teal,
    ),
    home: LoginScreen(),

  ));
}
