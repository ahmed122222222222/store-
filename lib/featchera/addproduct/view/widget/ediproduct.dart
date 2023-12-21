import 'package:fl3/featchera/addproduct/view/editpro.dart';
import 'package:flutter/material.dart';

class editprouct extends StatelessWidget {
      final String name,cat,price,dec,g,num,id;

  const editprouct({super.key, required this.name, required this.cat, required this.price, required this.dec, required this.g, required this.num, required this.id});
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: editbody(name: name,price: price,cat: cat,dec: dec,g: g,num: num,id: id,),
      backgroundColor: Colors.amberAccent,
     
    );
  }

}