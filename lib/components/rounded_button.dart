import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: size.width *0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xffcb1334)
        ),
        alignment: Alignment.center,
        child:  Text(
         this.title,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
        ),

      ),
    );
  }
}
