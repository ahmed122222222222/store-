import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/function/savedata.dart';
import '../../../login/presention/view/widget/Cuatombuttom.dart';
import '../../../login/presention/view/widget/Customtextttt.dart';

import 'addimage.dart';

// ignore: must_be_immutable
class Addprobod extends StatelessWidget {
  late String name,cat,price,des,g,nmm;
   GlobalKey<FormState>globalKey=GlobalKey();

  Addprobod({super.key});
  @override
 
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:70),
        child: Center(
          child: Form(
            key:globalKey ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyCustomImagePicker(),
                SizedBox(height: 15,),
              CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { name=s; }, str: 'enetr product name ',) 
                ,const  SizedBox(height: 15,)
              ,CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { des=s; }, str: 'enetr product name ',) ,
                const  SizedBox(height: 15,),
              CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { cat=s; }, str: 'enetr product name ',) ,
                const  SizedBox(height: 15,),
              CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { price=s; }, str: 'enetr product name ',) ,
                const  SizedBox(height: 15,),
              CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { g=s; }, str: 'enetr product name ',) ,
            const  SizedBox(height: 15,),
              CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { nmm=s; }, str: 'enetr product name ',) ,
               CustomButton(onPressed: () {  
              if(globalKey.currentState!.validate())
           {
            globalKey.currentState!.save();
            globalKey.currentState!.reset();
            addUser(name, price, des, cat, nmm, g);
           }
               }, str: 'add pro',)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
