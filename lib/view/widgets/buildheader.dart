import 'package:flutter/cupertino.dart';

Widget buildHeader(String text,{double? fontSize, Color? color}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize,color: color),
    ),
  );
}
