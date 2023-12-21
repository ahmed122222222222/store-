import 'package:fl3/core/rouer.dart';
import 'package:fl3/featchera/addproduct/data/adminreopimp.dart';
import 'package:fl3/featchera/addproduct/presention/maneger/cubit/loaddata_cubit.dart';
import 'package:fl3/featchera/addproduct/view/widget/ediproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// ignore: camel_case_types
class products extends StatelessWidget {
  const products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoaddataCubit, LoaddataState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is Loaddatasucee)
       { return GridView.builder(
        itemCount: state.pro.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: GestureDetector(
                onTapUp: (detailes) {
                  double dx = detailes.globalPosition.dx;
                  double dy = detailes.globalPosition.dy;
                  double dx2 = MediaQuery.of(context).size.width - dx;
                  double dy2 = MediaQuery.of(context).size.height - dy;
                  showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                      items: [
                       const PopupMenuItem(
                          child: Text("Edit"),
                          value: 'Edit',
                        ),
                    const    PopupMenuItem(
                          child:  Text(
                            "del",
                          ),
                          value: 'del',
                        )
                      ]).then((value) {
                    // Handle the selected action
                    if (value == 'Edit') {
                   Navigator.push(context,MaterialPageRoute(builder: (builder)=>editprouct(price: state.pro[index].price,name: state.pro[index].name,
                   cat: state.pro[index].cat,dec: state.pro[index].dec,g: state.pro[index].g,num: state.pro[index].num, id: state.pro[index].id,
                   )));
                    } else if (value == 'del') 
                    {
                      adminimp().del(state.pro[index].id);
                      BlocProvider.of<LoaddataCubit>(context).getpr();

                    }
                  });
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                        child: Image.asset(
                      "assset/images/jackets/jacket1.jpg",
                      fit: BoxFit.fill,
                    )),
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: .6,
                        child: Container(
                          color: Colors.white,
                          height: 75,
                          width: MediaQuery.of(context).size.width,
                          child:  Opacity(
                            opacity: 1,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Row(
                               
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.pro[index].name,
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold),
                                      ),
                               
                                      Text(
                                        '${state.pro[index].price}\$',
                                        style: TextStyle(color: Colors.black87,fontFamily: 'font'),
                                      ),
                                       Text(
                                        state.pro[index].dec,
                                        style:const TextStyle(color: Colors.black87),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 75,),
                                  Icon(Icons.favorite,color: Colors.red,size: 40,)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .8,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5),
        );}
        else {
          return SingleChildScrollView();
        }
      },
    );
  }
}
