 import 'package:bloc/bloc.dart';
import 'package:fl3/featchera/addproduct/data/productmodel.dart';
import 'package:meta/meta.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
   List<product> Products=[];
  void order(product pro,count){
emit(OrderLoad());
try {
 
  Products.add(pro);
  emit(Ordersucee(pro: Products));
  print(Products.length); 

} on Exception catch (e) {
  emit(Orderfailuer(errmas: e.toString()));
}

  }
}
