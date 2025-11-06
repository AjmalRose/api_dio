import 'package:flutter/material.dart';

Widget textCustom(String text,double fontSize){
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize
    ),);
}

Widget textCusomBold(String text, double fontSize,){
  return Text(
    text,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold
    )
  );
}