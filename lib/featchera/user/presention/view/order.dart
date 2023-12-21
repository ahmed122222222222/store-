import 'package:fl3/featchera/addproduct/data/productmodel.dart';
import 'package:fl3/featchera/user/presention/view/widget/Cuatombuttom.dart';
import 'package:fl3/featchera/user/presention/view/widget/manager/order/order_cubit.dart';
import 'package:fl3/featchera/user/presention/view/widget/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Custombodyy(),
    );
  }
}

class Custombodyy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderCubit, OrderState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is Ordersucee)
        {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.pro.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: bodyorder( count: 5, pro: state.pro[index],),
                ),
              ),
             
            ),
             CustomButto(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (builder)=>payment())) ; }, str: 'check ou',)
          ],
        );

      
      }
      else{
        return CircularProgressIndicator();
       }
      },
      
    );
  }
}

class bodyorder extends StatelessWidget {
  product pro;
  int count;

  bodyorder({super.key, required this.pro, required this.count});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .85,
          color: Color(0xFFA29B9B),
          height: MediaQuery.of(context).size.height * .15,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(pro.image),
                Column(
                  children: [
                    Text(
                      pro.name,
                      style: TextStyle(fontFamily: 'font', fontSize: 18),
                    ),
                    Text("price:${pro.price}",
                        style: TextStyle(fontFamily: 'font', fontSize: 18)),
                    Text("qun:$count",
                        style: TextStyle(fontFamily: 'font', fontSize: 18))
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.payment))
              ],
            ),
          ),
        ),
        del()
      ],
    );
  }
}

class del extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .15,
      color: Colors.redAccent,
      height: MediaQuery.of(context).size.height * .15,
      child: TextButton(
        child: Text(
          "del",
          style: TextStyle(fontFamily: 'fonrt', color: Colors.black),
        ),
        onPressed: () {},
      ),
    );
  }
}

/*class bodyorder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    
      height: 150,
      color: Colors.grey,
      child: Row(
        children: [
          Image.asset('assset/images/trousers/trouser3.jpg'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "trouser1",
                  style: TextStyle(fontSize: 24, fontFamily: 'font'),
                ),
                Text(
                  "price:500\$",
                  style: TextStyle(fontSize: 24, fontFamily: 'font'),
                ),
                
              ],
            ),
          ),
          Expanded(
            child:
          ),
        ],
      ),
    );
  }/
}
}
*/