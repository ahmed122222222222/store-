import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl3/featchera/user/data/userrepoimp.dart';
import 'package:meta/meta.dart';

part 'loadpro_state.dart';

class LoadproCubit extends Cubit<LoadproState> {
  LoadproCubit({required this.user}) : super(LoadproInitial());
  uerimp user;
 void getpro() {
  try {
  emit(Loadproloading());
   var res= user.listenToData();
   emit(Loadprosucess(querySnapshot: res));
} on Exception catch (e) {
emit(Loadprofauiler(errmass: e.toString()));
}
 
  } 
}
