import 'package:fl3/featchera/addproduct/data/adminreopimp.dart';
import 'package:fl3/featchera/addproduct/data/productmodel.dart';
import 'package:fl3/featchera/addproduct/presention/maneger/cubit/loaddata_cubit.dart';
import 'package:fl3/featchera/addproduct/view/widget/addimage.dart';
import 'package:fl3/featchera/addproduct/view/widget/editproductbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/presention/view/widget/Cuatombuttom.dart';
import '../../login/presention/view/widget/Customtextttt.dart';

// ignore: camel_case_types
class editpro extends StatelessWidget {
  const editpro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products(),
    );
  }
}

class editbody extends StatelessWidget{


  editbody({super.key, required this.name, required this.cat, required this.price, required this.dec, required this.g, required this.num, required this.id, });
    final String name,cat,price,dec,g,num,id;
  late String  n,c,p,d,k; 
  @override
  Widget build(BuildContext context) {
   
   return BlocConsumer<LoaddataCubit, LoaddataState>(
     listener: (context, state) {
       // TODO: implement listener
     },
     builder: (context, state) {
      if(state is Loaddatasucee)
     {  return 
      
      Container(
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:70),
          child: Center(
            child: Form(
            
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyCustomImagePicker(),
                 const SizedBox(height: 15,),
                CustomTextFormField(iconData: Icons.abc, onSaved: (String s )  {s==null?n=name:  n =s; }, str:name,) 
                  ,const  SizedBox(height: 15,)
                ,CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { p=s; }, str:price,) ,
                  const  SizedBox(height: 15,),
                CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { c=s; }, str: cat,) ,
                  const  SizedBox(height: 15,),
                CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) {d=s;  }, str: dec,) ,
                  const  SizedBox(height: 15,),
                CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) {k=g; }, str: g,) ,
              const  SizedBox(height: 15,),
                CustomTextFormField(iconData: Icons.abc, onSaved: (String s ) { c=s; }, str:num,) ,
                 CustomButton(onPressed: () { 
                  try {
                    adminimp().updateproduct(id, n, p, c,d,k, c);
                 print(c);
                 BlocProvider.of<LoaddataCubit>(context).getpr();   
                  } catch (e) {
                    print(e.toString());
                  } 
                 
                 }, str: 'edit pro',)
                ],
              ),
            ),
          ),
        ),
         ),
       );}
     else {
      return CircularProgressIndicator();
     }
     },
   );
  }

}
