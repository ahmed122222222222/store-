import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButto extends StatelessWidget {
  CustomButto({Key ?key,required this.onPressed, required this.str});
  void Function()? onPressed;
  final String str;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC12F)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child:  Text(
          str,
          style:const TextStyle(fontSize: 20, color: Colors.white,fontFamily: 'font'),
        ),
      ),
    );
  }
}