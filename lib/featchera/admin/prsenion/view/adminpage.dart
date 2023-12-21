import 'package:fl3/core/rouer.dart';
import 'package:fl3/featchera/addproduct/data/adminreopimp.dart';
import 'package:fl3/featchera/addproduct/presention/maneger/cubit/loaddata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Adminpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Adminpagebody(),
      backgroundColor: Color(0xFFFFC12F),
    );
  }
}

class Adminpagebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customevlu(
            str: 'add product',
            onPressed: () {
              GoRouter.of(context).push(router.addpr);
            },
          ),
          const SizedBox(
            height: 30,
          ),
          BlocConsumer<LoaddataCubit, LoaddataState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return customevlu(
                str: 'edit product',
                onPressed: () {
                  GoRouter.of(context).push(router.editpr);
                  BlocProvider.of<LoaddataCubit>(context).getpr();
                 
                },
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
          customevlu(
            str: 'view order',
            onPressed: () {
              GoRouter.of(context).push(router.addpr);
            },
          ),
        ],
      ),
    );
  }
}

class customevlu extends StatelessWidget {
  const customevlu({super.key, required this.str, required this.onPressed});
  final String str;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, color: Colors.black87))),
      child: Text(
        str,
        style: const TextStyle(color: Colors.black87),
      ),
    );
  }
}
