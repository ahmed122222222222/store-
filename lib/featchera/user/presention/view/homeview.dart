import 'package:fl3/featchera/addproduct/data/productmodel.dart';
import 'package:fl3/featchera/user/presention/account.dart';
import 'package:fl3/featchera/user/presention/view/order.dart';
import 'package:fl3/featchera/user/presention/view/widget/payment.dart';
import 'package:fl3/featchera/user/presention/view/widget/userbody.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
var cx;
class homeuser extends StatefulWidget {
  homeuser({Key? key}) : super(key: key);

  @override
  State<homeuser> createState() => _homeuserState();
}

class _homeuserState extends State<homeuser> {
  int tabindex = 0;
  int index = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [
      UserBody(), // Screen 1
    order(), // Screen 2
   payment(), // Screen 3
   acount(), // Screen 4
    ];
  }

  @override
  Widget build(BuildContext context) {
    cx = context;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar:  buildAppBar(),
        body: IndexedStack(
          index: index,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (v) {
            setState(() {
              index = v;
            });
          },
          currentIndex: index,
          selectedItemColor: Colors.black87,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_rounded), label: "order"),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment), label: "payment"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box_sharp), label: "account"),
          ],
        ),
      ),
    );
  }

  TabBar tabbar() {
    return TabBar(
      onTap: (value) {
        setState(() {
          tabindex = value;
        });
        print(tabindex);
      },
      indicatorColor: const Color(0xFFFFC12F),
      tabs: [
        Text(
          "jacket",
          style: TextStyle(
              color: tabindex == 0 ? Colors.black : const Color(0xFFC1BDB0),
              fontSize: 18),
        ),
        Text(
          "shoes",
          style: TextStyle(
              color: tabindex == 1 ? Colors.black : const Color(0xFFC1BDB0),
              fontSize: 18),
        ),
        Text(
          "T-shirts",
          style: TextStyle(
              color: tabindex == 2 ? Colors.black : const Color(0xFFC1BDB0),
              fontSize: 18),
        ),
        Text(
          "Trouser",
          style: TextStyle(
              color: tabindex == 3 ? Colors.black : const Color(0xFFC1BDB0),
              fontSize: 18),
        ),
      ],
    );
  }
  
  buildAppBar() {
    switch (index) {
      case 0:
        return AppBar(
          titleSpacing: -50,
          elevation: 0,
          title: const Text(
            "discover",
            style: TextStyle(
                fontFamily: 'font', fontSize: 32, color: Colors.black87),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black87,
              ),
            ),
          ],
          backgroundColor: Colors.white,
          bottom: tabbar(),
        );
      case 1:
        return AppBar(
         backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Order",
          style: TextStyle(
            color: Colors.black87,
            fontFamily: 'font',
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.shopping_cart_sharp,
              color: Colors.black87,
            ),
          )
        ],
        );
      case 2:
        return AppBar(
          titleSpacing: -50,
          elevation: 0,
          title: const Text(
            "discover",
            style: TextStyle(
                fontFamily: 'font', fontSize: 32, color: Colors.black87),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black87,
              ),
            ),
          ],
          backgroundColor: Colors.white,
        );
      case 3:
        return AppBar(
        backgroundColor: Colors.white,
      leading: Image.asset("assset/images/icons/Back.png"),
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text('Account',style: GoogleFonts.oxanium(fontSize: 32,color: Colors.black),),
      actions: [Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset('assset/images/icons/Settings.png'),
      )]
        );
      default:
        return AppBar();
    }
  }
}
 List<product> products=[];





