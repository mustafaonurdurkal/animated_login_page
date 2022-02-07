
import 'package:flutter/material.dart';

import 'input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.icon,
    required this.hint
  }) : super(key: key);

  final IconData icon;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return  InputContainer(
        child:TextField(
          cursorColor:Colors.black54 ,
          decoration: InputDecoration(
              icon: Icon(icon,color: Color(0xffcb1334),),
              hintText: hint,
              border: InputBorder.none
          ),
        ));
  }
}
