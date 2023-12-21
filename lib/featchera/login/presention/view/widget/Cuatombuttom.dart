import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({Key ?key,required this.onPressed, required this.str});
  void Function()? onPressed;
  final String str;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black87),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child:  Text(
          str,
          style:const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}