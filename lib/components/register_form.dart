
import 'package:animated_login_page/components/rounded_button.dart';
import 'package:animated_login_page/components/rounded_input_dart.dart';
import 'package:animated_login_page/components/rounded_password_input.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {

   RegisterForm({
    Key? key,
    required this.isLogin,
    required this.animationDuration,
    required this.size,
    required this.defaultLoginSize,
     required this.update,
  }) : super(key: key);

   final ValueChanged<String?> update;
  final bool isLogin;
  final Duration animationDuration;
  final Size size;
  final double defaultLoginSize;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  List <String> items=['Hizmet Alan','Doktor','Dis Hekimi'];

   String? selectedItem = 'Hizmet Alan';
  @override
  Widget build(BuildContext context) {

    Size size=MediaQuery.of(context).size;

    return AnimatedOpacity(
      opacity: widget.isLogin? 0.0 : 1.0,
      duration: widget.animationDuration*5,
      child: Visibility(
        visible: !widget.isLogin,
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              width: widget.size.width,
              height: widget.defaultLoginSize,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:     [
                  Expanded(flex:10 , child: SizedBox()),
                  Expanded(flex:30 , child: Image(image: const AssetImage('assets/images/doctor-logo-49389.png')),),

                  Expanded(
                    flex: 10,
                    child:  Container(
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffcb1334).withAlpha(50),
                        ),
                        width: size.width*0.8,
                        child: buildDropdownButton())
                 ),//dropdown secim

                  Expanded(flex:10 , child: RoundedInput(icon:Icons.mail,hint: 'Kullanici Adi')),
                  Expanded(flex:10 , child: RoundedInput(icon:Icons.phone,hint: 'Telefon Numarasi')),
                  Expanded(flex:10 , child: RoundedPasswordInput(icon: Icons.lock,hint: 'Şifre')),
                  Expanded(flex:8 , child: RoundedButton(title:  'KAYIT OL')),
                  Expanded(flex:10 , child: SizedBox()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildDropdownButton() {
    return DropdownButtonFormField<String>(
                  dropdownColor: Color(0xffcb1334),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(width: 3 ,color: Color(0xffcb1334) )
                    )
                  ) ,
                  value: selectedItem,
                  icon: const Icon(Icons.arrow_downward,color: Color(0xffcb1334)),
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                  onChanged: (item) => setState(()=> selectedItem=item) ,
                  items: items.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                     )).toList(),
                );
  }
}



