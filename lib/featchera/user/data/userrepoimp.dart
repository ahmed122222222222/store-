import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl3/featchera/user/data/userrepo.dart';

class uerimp extends userrepo {
  @override
Stream<QuerySnapshot> listenToData() {
final FirebaseFirestore firestore = FirebaseFirestore.instance; 
  return firestore.collection('pro').snapshots();
}
}