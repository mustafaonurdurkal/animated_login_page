import 'package:animated_login_page/components/rounded_button.dart';
import 'package:animated_login_page/components/rounded_input_dart.dart';
import 'package:animated_login_page/components/rounded_password_input.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.size,
    required this.defaultLoginSize,
  }) : super(key: key);

  final Size size;
  final double defaultLoginSize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: defaultLoginSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:     const [
              Expanded(flex:10 , child: SizedBox()),
              Expanded(flex:30 , child: Image(image: AssetImage('assets/images/doctor-logo-49389.png')),),
              Expanded(flex:4 , child: SizedBox()),
              Expanded(flex:10 , child: RoundedInput(icon:Icons.mail,hint: 'Kullanıcı Adı')),
              Expanded(flex:10 , child: RoundedPasswordInput(icon: Icons.lock,hint: 'Şifre')),
              Expanded(flex:8 , child: RoundedButton(title:  'GİRİS YAP')),
              Expanded(flex:10 , child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}


