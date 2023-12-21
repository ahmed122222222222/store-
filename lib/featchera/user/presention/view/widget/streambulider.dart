import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../addproduct/data/productmodel.dart';
import '../../manager/loadproduct/loadpro_cubit.dart';
import '../homeview.dart';
import 'graidview.dart';

class CustomStreamBuilder extends StatelessWidget {
  final String cat;

  const CustomStreamBuilder({required this.cat});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadproCubit, LoadproState>(
      listener: (context, state) {
     
      },
      builder: (context, state) {
        if (state is Loadprosucess) {
          return StreamBuilder<QuerySnapshot>(
            stream: state.querySnapshot,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<product> pro = [];
                List<DocumentSnapshot> documents = snapshot.data!.docs;

                documents.forEach((element) {
                  product produc =
                      product.fromJson(element.data()!, element.id);
                  pro.add(produc);
                });
                products=[...pro];
                final filteredProducts =
                    pro.where((pr) => pr.cat == cat).toList();
                return Expanded(
                  child: customgraidview(pro: filteredProducts),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}