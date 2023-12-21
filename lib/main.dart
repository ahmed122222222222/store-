import 'package:firebase_core/firebase_core.dart';

import 'package:fl3/core/rouer.dart';
import 'package:fl3/featchera/addproduct/data/adminreopimp.dart';
import 'package:fl3/featchera/addproduct/presention/maneger/cubit/loaddata_cubit.dart';
import 'package:fl3/featchera/login/data/repoimp.dart';
import 'package:fl3/featchera/login/presention/manager/logincubit/logincubit_cubit.dart';
import 'package:fl3/featchera/user/data/userrepo.dart';
import 'package:fl3/featchera/user/data/userrepoimp.dart';
import 'package:fl3/featchera/user/data/userrepoimp.dart';
import 'package:fl3/featchera/user/presention/manager/loadproduct/loadpro_cubit.dart';
import 'package:fl3/featchera/user/presention/view/widget/manager/order/order_cubit.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featchera/login/presention/manager/sinup/singincubit_cubit.dart';
import 'featchera/user/data/userrepoimp.dart';
import 'featchera/user/data/userrepoimp.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp( MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});
  final uerimp user=uerimp();
 final Loginimp loginrep=Loginimp();
 adminimp a=adminimp();
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(
          create: (context) => SingincubitCubit(loginrep: loginrep),
          
         ), BlocProvider(
          create: (context) => LogincubitCubit(loginrep: loginrep),
          
         ), BlocProvider(
          create: (context) => LoaddataCubit(h: a),
          
         ),
          BlocProvider(
          create: (context) => LoadproCubit(user:user)..getpro(),
          
         ),
         BlocProvider(
          create: (context) => OrderCubit()
          
         ),
            
          
      ],
      child: MaterialApp.router(
        
        debugShowCheckedModeBanner: false,
        
        routerConfig: router.routerr,
      ),
    );
  }
}

