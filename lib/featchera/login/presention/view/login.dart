// ignore_for_file: sort_child_properties_last


import 'package:fl3/featchera/login/presention/view/widget/loginbody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFC12F),
        body: LoginBody(),
      ),
    );
  }
}





