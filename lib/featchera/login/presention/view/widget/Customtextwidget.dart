
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key, required this.str,required this.onTap});
final String str;
 final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       const Text(
          "don have account ?",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
           str,
            style:const TextStyle(color: Colors.black87, fontSize: 18),
          ),
        ),
      ],
    );
  }
}