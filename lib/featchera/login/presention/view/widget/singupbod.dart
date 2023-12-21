import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../manager/sinup/singincubit_cubit.dart';
import 'Cuatombuttom.dart';
import 'Customtextttt.dart';
import 'Customtextwidget.dart';

class Singupbody extends StatefulWidget {
  Singupbody({Key? key});

  @override
  State<Singupbody> createState() => _SingupbodyState();
}
var c;
class _SingupbodyState extends State<Singupbody> {
  final GlobalKey<FormState> globalKey = GlobalKey();
 // ignore: unused_field
 final _globalKey = GlobalKey<ScaffoldMessengerState>();
  var email, pass, username;

  bool isloadin=false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingincubitCubit, SingincubitState>(
      listener: (context, state) {
        c=context;
      if(state is Singincubitloading)
      {
        isloadin=true;
      }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloadin,
          child: Form(
            key: globalKey,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * .2),
                    Image.asset("assset/images/icons/buyicon.png"),
                    const Text(
                      "Bay It",
                      style: TextStyle(
                          fontFamily: 'font',
                          fontSize: 32,
                          color: Colors.black87),
                    ),
                    CustomTextFormField(
                      iconData: Icons.account_balance,
                      str: 'enter your username',
                      onSaved: (String s) {
                        username = s;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      iconData: Icons.email,
                      str: 'enter your email',
                      onSaved: (String s) {
                        email = s;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      iconData: Icons.password_sharp,
                      str: "enter your password",
                      onSaved: (String s) {
                        pass = s;
                      },
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          globalKey.currentState!.save();
                         isloadin = true;
                        setState(() {});
                      

                            await BlocProvider.of<SingincubitCubit>(context)
                                .sinup(email, username, pass);
                          isloadin = false;
                        setState(() {});
                        }
                      },
                      str: 'sign up',
                    ),
                    const SizedBox(height: 35),
                     TextWidget(str: 'login', onTap: () { Navigator.pop(context); },),
                    
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
