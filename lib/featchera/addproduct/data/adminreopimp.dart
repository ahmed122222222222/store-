import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl3/featchera/addproduct/data/adminrepo.dart';
import 'package:fl3/featchera/addproduct/data/productmodel.dart';


import 'package:cloud_firestore/cloud_firestore.dart';


class adminimp extends adminrepo{
  @override
 List<product> getRealtimeData() {
  List<product> productList = [];
  FirebaseFirestore.instance
      .collection('pro') // Replace with your collection name
      .snapshots()
      .listen((QuerySnapshot snapshot) {
    snapshot.docs.forEach((DocumentSnapshot doc) {
      product produc = product.fromJson(doc.data(),doc.id);
      productList.add(produc);
    });
  });
  return productList;
}
  @override
Future<List<product>> getProductsFromFirestore() async {
  try {
  QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('pro').get();

    List<product> productList = [];
 
    querySnapshot.docs.forEach((documentSnapshot) {
      product produc = product.fromJson(documentSnapshot.data(),documentSnapshot.id);
      productList.add(produc);
      
      
    });
  

    return productList;
  } catch (e) {
    print(e);
    return [];
  }
}

  @override
  Future<void> savedata(name, price, des, ca, nm, g) {
     // Call the user's CollectionReference to add a new user
  CollectionReference pro = FirebaseFirestore.instance.collection('pro');

  // Define the data to be saved
  Map<String, dynamic> data = {
    'full_name': name, // John Doe
    'company': nm, // Stokes and Sons
    'cat': ca ,// 42
    'price':price,
    'g':g,
    'nm':nm,
  };

  // Add the data to the users collection
  return pro
      .add(data)
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
  }
  
  @override
  void updateproduct(id,name, price, des, ca, nm, g) {
   final documentReference = FirebaseFirestore.instance.collection('pro').doc(id);

documentReference.update({
  'full_name': name, // John Doe
    'company': nm, // Stokes and Sons
    'cat': ca ,// 42
    'price':price,
    'g':g,
    'nm':nm,
}).then((_) {
  print('Document updated successfully!');
}).catchError((error) {
  print('Error updating document: $error');
});
  }
  
  @override
  void del(id) {
      final documentReference = FirebaseFirestore.instance.collection('pro').doc(id);
      documentReference.delete();
  }
  
 
}