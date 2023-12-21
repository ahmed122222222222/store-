import 'package:fl3/core/rouer.dart';
import 'package:fl3/featchera/login/data/repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl3/featchera/login/presention/view/widget/loginbody.dart';
import 'package:fl3/featchera/login/presention/view/widget/singupbod.dart';
import 'package:fl3/featchera/user/presention/manager/loadproduct/loadpro_cubit.dart';
import 'package:fl3/featchera/user/presention/view/homeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class Loginimp extends Loginrep {
@override
Future<void> reg(email,pass,username) async{
 try {
    // Create the user account with email and password
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      
      password: pass,
    );
    
    // Get the user ID of the newly created user
    String userId = userCredential.user!.uid;
    
    // Create a new document in Firestore for the user
    await FirebaseFirestore.instance.collection('users').doc(userId).set({
      'username': username,
    });
    
    // Registration successful
    print('User registered successfully');
     showSnackBar(c, "User registered successfully");
  }on FirebaseAuthException catch (ex) {
       if (ex.code == 'The email -address -is -badly -formatted') {
      showSnackBar(c, "The email address is badly formatted");
    } else if (ex.code == 'weak-password') {
      showSnackBar(c, "weak-password");
    } else if (ex.code == 'email-already-in-use') {
      showSnackBar(c, "email-already-in-use");
    } else {
      print('Error creating user: $ex');
      showSnackBar(c, "The email address is badly formatted");
    }
  }
}
@override
Future<void> login(email,pass ) async{
 if(admin=='admin')
 {
  if(pass=='waffa123'&& email=='waffa123@gmail.com')
  {
 UserCredential userrrrr = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: pass!);
              print('admin login successfully');
     showSnackBar(x, "admin login successfully");
      GoRouter.of(x).push(router.kSearchView);

  }
  else 
  {
   print('not admin');
     showSnackBar(x, "not admin please check email and pass");
  }
 }
 else if(admin=='user')
 {
  try
  {
     UserCredential userrrrr = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email!, password: pass!);
                 print('User login successfully');
     showSnackBar(x, "User login successfully");
   
      GoRouter.of(x).push(router.users);      

    
  } on FirebaseAuthException catch (ex) 
  {
     if(ex.code=='wrong-password')
  {
     showSnackBar(x, "worng pass");
  }
   
  else if(ex.code=='user-not-found')
  {
     showSnackBar(x, "user not found ");
  }
  else 
  {
      print('Error creating user: $ex');
      showSnackBar(x, "The email address is badly formatted");
    }

  }
   

 }
}
void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),

    ),
  );}
}