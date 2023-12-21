import 'package:bloc/bloc.dart';

import 'package:fl3/featchera/login/data/repoimp.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'singincubit_state.dart';

class SingincubitCubit extends Cubit<SingincubitState> {
  SingincubitCubit({ required this.loginrep}) : super(SingincubitInitial());
  Loginimp loginrep;
  Future <void> sinup(email ,username,pass) async {
    emit(Singincubitloading());
   try {
  await loginrep.reg(email, pass, username );
} on Exception catch (e) {
 emit(Singincubitfauiler(errr: e.toString()));
}
  }
  
}
