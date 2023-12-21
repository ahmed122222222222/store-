import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addUser(name,price,des,ca,nm,g) {
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