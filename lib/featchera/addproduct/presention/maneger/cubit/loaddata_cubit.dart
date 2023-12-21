
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl3/featchera/addproduct/data/adminreopimp.dart';
import 'package:fl3/featchera/addproduct/data/productmodel.dart';

import 'package:flutter/cupertino.dart';


part 'loaddata_state.dart';

class LoaddataCubit extends Cubit<LoaddataState> {
  LoaddataCubit({required this.h} ) : super(LoaddataInitial());
  adminimp h;
  Future<void>getpr() async{
       emit(Loaddataloding());
   try {
  var res=await h.getProductsFromFirestore();

  emit(Loaddatasucee(pro: res));
} on Exception catch (e) {
 emit(Loaddatafauiler(errmas: e.toString()));
}

  } 
}
