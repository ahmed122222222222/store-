import 'package:fl3/featchera/addproduct/view/editpro.dart';
import 'package:fl3/featchera/login/presention/view/login.dart';
import 'package:fl3/featchera/login/presention/view/Singup.dart';
import 'package:fl3/featchera/user/presention/view/card.dart';
import 'package:fl3/featchera/user/presention/view/homeview.dart';
import 'package:go_router/go_router.dart';

import '../featchera/addproduct/view/addprodut.dart';

import '../featchera/admin/prsenion/view/adminpage.dart';

abstract class router {
  static const kHomeView = '/LoginPage';
  static const Singup = '/Signup';
  static const kSearchView = '/Adminpage';
   static const addpr = '/Addpro';
   static const editpr='/editpro';
   static const Edit='/editprouct';
      static const users='/homeuser';
  static const cards='/card'; 
  static final routerr = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
     GoRoute(
      path: Singup,
      builder: (context, state) => const Signup(),
    ),
      GoRoute(
      path: kSearchView,
      builder: (context, state) =>  Adminpage()
    ),
    GoRoute(
      path: addpr,
      builder: (context, state) =>  Addpro(),
    ),
     GoRoute(
      path: editpr,
      builder: (context, state) =>  const editpro(),
    ),
     GoRoute(
      path: users,
      builder: (context, state) =>   homeuser(),
    ),
      

  ]);
}