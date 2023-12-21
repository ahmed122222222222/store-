import 'package:fl3/core/rouer.dart';
import 'package:fl3/featchera/user/presention/view/homeview.dart';
import 'package:fl3/featchera/user/presention/view/widget/graidview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/function/getproductbycategory.dart';
import '../../../../addproduct/data/productmodel.dart';

Widget ProductsView(String pCategory, List<product> allProducts) {
  List<product> pro;
  pro = getProductByCategory(pCategory, allProducts);
  return GestureDetector(
    onTap: ()=>GoRouter.of(cx).push(router.cards),
    child: GridView.builder(
      itemCount: pro.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                pro[index].image,
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
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                       child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                pro[index].name,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${pro[index].price}',
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'font',
                                ),
                              ),
                              Text(
                                pro[index].dec,
                                style: const TextStyle(color: Colors.black87),
                              ),
                            ],
                          ),
                          const SizedBox(width: 75),
                          const Icon(Icons.favorite, color: Colors.red, size: 40),
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