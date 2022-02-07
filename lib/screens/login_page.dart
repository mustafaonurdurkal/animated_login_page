import 'package:animated_login_page/components/login_form.dart';
import 'package:animated_login_page/components/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin{

  bool isLogin= true;
  late Animation<double> containerSize;
  Duration animationDuration =Duration(milliseconds: 270);
  late AnimationController animationController;



  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    animationController = AnimationController(vsync: this,duration: animationDuration);
  }


  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }
  String? _dropdownValue='';
  void _update(String? value){
        setState(() {
          _dropdownValue = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;                        //Kullanilan cihazin olculerini size degiskenine atadik
    double viewInsert =MediaQuery.of(context).viewInsets.bottom; // Klavyenin acilip acilmadigina  bu degisken ile karar verecegiz
    double defaultLoginSize = size.height - (size.height*0.2);
    double defaultRegisterSize = size.height - (size.height*0.1);

    containerSize = Tween<double>(begin: size.height * 0.1 , end: defaultRegisterSize).animate(CurvedAnimation(parent: animationController, curve: Curves.linear));

    return Scaffold(

      body: Stack(
        children: [
          //background
          buildContainerBackground(),

          //login widgets
          LoginForm(size: size, defaultLoginSize: defaultLoginSize),

          //Animasyon
          AnimatedBuilder(
            animation: animationController,
            builder: (context,child){
              //  tiklandiginda  alttaki bolmenin kaybolmasi
              if(viewInsert == 0 && isLogin){
                return buildRegisterContainer();
              }else if(!isLogin){
                return buildRegisterContainer();
              }
              return Container();
            },
          ),

          //Register Form
          RegisterForm(isLogin: isLogin, animationDuration: animationDuration, size: size, defaultLoginSize: defaultLoginSize,update: _update),

          // iptal butonu
          buildCancelButton(size),

        ],
      ),
    );
  }

  AnimatedOpacity buildCancelButton(Size size) {
    return AnimatedOpacity(
          opacity: isLogin? 0.0 : 1.0,
          duration: animationDuration,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: size.width,
              height: size.height*0.1,
              alignment: Alignment.bottomCenter,
              child:  IconButton(
                icon: Icon(Icons.close),
                onPressed: isLogin ? null : (){
                  animationController.reverse();
                  setState(() {
                    isLogin= !isLogin;
                  });
                },
                color: Color(0xffcb1334),
              ),
            ),
          ),
        );
  }

  Container buildContainerBackground() {
    return Container(
          decoration:  const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end:   Alignment.bottomLeft,
                  colors: [Color(0xfffdfdfd),Color(0xff7fc2bd)]
              )
          ),
        );
  }

  Widget buildRegisterContainer(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration:  const BoxDecoration(
          color: Color(0xffcbbcbe),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap:!isLogin ? null :  (){
            animationController.forward();
            setState(() {
              isLogin = !isLogin;
            });
          },
          child: isLogin? Text('Hala Kayit olmadiniz mi?',style: TextStyle(
              color:Color(0xff0e0909),
              fontSize: 15
          )
          ):null,
        ),
      ),

    );
  }
}


