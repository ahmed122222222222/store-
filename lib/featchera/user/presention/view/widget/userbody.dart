import 'package:fl3/featchera/user/presention/view/widget/proudctview.dart';
import 'package:fl3/featchera/user/presention/view/widget/streambulider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/loadproduct/loadpro_cubit.dart';
import '../homeview.dart';

class UserBody extends StatefulWidget {
  @override
  State<UserBody> createState() => _UserBodyState();
}
 
class _UserBodyState extends State<UserBody> {
  int tabindex = 0;
 
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoadproCubit, LoadproState>(
      listener: (context, state) {
        if(state is Loadprosucess)
        { 
              
              
        }
      },
      builder: (context, state) {
        return TabBarView(
          children: [
         const   CustomStreamBuilder(cat: 'jacket'),
            ProductsView('shose', products),
            ProductsView('T-shirts', products),
            ProductsView('Trouser', products),
          ],
        );
      },
    );
  }
}
