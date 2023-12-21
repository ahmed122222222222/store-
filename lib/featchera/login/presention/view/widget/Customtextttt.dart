import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({Key? key,required this.iconData, required this.str,required this.onSaved,this.pass=false}) : super(key: key);
   final IconData iconData;
   final String str;
   final bool pass;
  final Function(String)?  onSaved;
   String errma (String str)
  {
    switch(str)
    {
      case "ener our email": return 'email is empty'; 
      case "enter your pass":return 'pass is empy ';
    }
    return 'vule is requrid';
  }
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
       onChanged: onSaved ,
        validator: (value) {
         if(value!.isEmpty )
         {
          return errma(str);
         }
         return null;
        },
        obscureText:pass ,
        decoration: InputDecoration(
          hintText:str ,
          hintStyle:const TextStyle(color: Colors.black12),
          prefixIcon: Icon(iconData,color: const Color(0xFFFFC12F),),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
            ),
          ),
          filled: true,
          fillColor: const Color(0xFFFFE6AC),
        ),
      ),
    );
  }
}
