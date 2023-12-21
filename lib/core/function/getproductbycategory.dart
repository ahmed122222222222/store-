import 'package:fl3/featchera/addproduct/data/productmodel.dart';

List<product> getProductByCategory(String kJackets, List<product> allproducts) {
  List<product> products = [];
  try {
    for (var product in allproducts) {
      if (product.cat == kJackets) {
        products.add(product);
      }
    }
  } on Error catch (ex) {
    print(ex);
  }
  return products;
}