import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl3/core/rouer.dart';
import 'package:fl3/featchera/user/presention/view/card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../addproduct/data/productmodel.dart';
 var con;
// ignore: camel_case_types
class customgraidview extends StatefulWidget {
  const customgraidview({
    super.key,
    required this.pro,
  });

  final List<product> pro;

  @override
  State<customgraidview> createState() => _customgraidviewState();
}
int iv=0;
class _customgraidviewState extends State<customgraidview> {
  @override
  Widget build(BuildContext context) 
  {
   con=context;
   int i=0;
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (builder)=>card(pro: widget.pro[i]))
      
      ),
      child: GridView.builder(
        itemCount: widget.pro.length,
        
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
       iv=index;  
 print(iv);
      
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  widget.pro[index].image,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Opacity(
                  opacity: .6,
                  child: Container(
                    color: Colors.white,
                    height: 75,
                    width: MediaQuery.of(context).size.width,
                    child: Opacity(
                      opacity: 1,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.pro[index].name,
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${widget.pro[index].price}',
                                  style: const TextStyle(
                                    color: Colors.black87,
                                    fontFamily: 'font',
                                  ),
                                ),
                                Text(
                                  widget.pro[index].dec,
                                  style: const TextStyle(color: Colors.black87),
                                ),
                              ],
                            ),
                            const SizedBox(width: 75),
                            const Icon(Icons.favorite,
                                color: Colors.red, size: 40),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        
      ),
      
    );
    
  }
}