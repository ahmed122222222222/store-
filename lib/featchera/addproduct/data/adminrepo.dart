import 'package:fl3/featchera/addproduct/data/productmodel.dart';

abstract class adminrepo{
  Future<void>savedata(name,price,des,ca,nm,g);
Future<List<product>> getProductsFromFirestore() ;
void updateproduct(id,name, price, des, ca, nm, g);
void del(id);

List<product> getRealtimeData();
}