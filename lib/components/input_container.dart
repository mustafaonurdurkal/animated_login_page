
import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:size.width*0.03,vertical: size.height *0.0075 ),
        width: size.width*0.8,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0xffcb1334).withAlpha(50),
        ),
        child: child ,
      ),
    );
  }
}