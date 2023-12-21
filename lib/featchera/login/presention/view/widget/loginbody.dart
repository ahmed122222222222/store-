import 'package:fl3/core/rouer.dart';
import 'package:fl3/featchera/login/presention/manager/logincubit/logincubit_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'Cuatombuttom.dart';
import 'Customtextttt.dart';
import 'Customtextwidget.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key});
 
  @override
  State<LoginBody> createState() => _LoginBodyState();
}
var x;
String admin='';
class _LoginBodyState extends State<LoginBody> {
  final GlobalKey<FormState>globalKey=GlobalKey();
var email,pass; 
bool isbool=false;
  
  @override
  Widget build(BuildContext context) {
    x=context;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: globalKey,
        
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height *.2),
              Image.asset("assset/images/icons/buyicon.png"),
              const Text(
                "Bay It",
                style: TextStyle(fontFamily: 'font', fontSize: 32, color: Colors.black87),
              ),
              const SizedBox(height: 50),
             CustomTextFormField(iconData: Icons.email, str: 'ener our email', onSaved: (String s ) { email=s; }, ),
              const SizedBox(height: 5),
             CustomTextFormField(iconData:Icons.password, str: 'enter your pass', onSaved: (String s ) {pass=s;  },pass: true,),
              const SizedBox(height: 20),
              CustomButton(onPressed: (){
                if (  globalKey.currentState!.validate()) {
                  globalKey.currentState!.save();
                  try {
  BlocProvider.of<LogincubitCubit>(context).log(email, pass);
  print(admin);
 

// ignore: unused_catch_clause
} on Exception catch (e) {
  // TODO
}
  
                  }
                
                              }, str: 'login',),
              const SizedBox(height: 35),
              TextWidget(str: 'sing up', onTap: () { GoRouter.of(context).push(router.Singup); },),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal:30,vertical: 10),
               child: Row(
  children: [
    Expanded(
      
        child: GestureDetector(
          onTap: ()=>setState(() {
            isbool = true;
            admin='admin';
          })
          ,
          child: Text(
            "iam admin",
            style: TextStyle(
              color: isbool ? const Color(0xFFFFC12F) : Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
    
    ),
    Expanded(
      child: GestureDetector(
        onTap: () {
            setState(() {
            isbool = false;
            admin='user';

          });
        },
        child: Text(
          "iam user",
          style: TextStyle(
            color: !isbool ? const Color(0xFFFFC12F) : Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ],
),
             )
            ],
          ),
        ),
      ),
    );
  }
}
