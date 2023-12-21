import 'package:fl3/core/snakbar.dart';
import 'package:fl3/featchera/addproduct/data/productmodel.dart';
import 'package:fl3/featchera/login/presention/view/widget/Cuatombuttom.dart';
import 'package:fl3/featchera/user/presention/view/order.dart';
import 'package:fl3/featchera/user/presention/view/widget/Cuatombuttom.dart';
import 'package:fl3/featchera/user/presention/view/widget/manager/order/order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class card extends StatelessWidget {
  const card({super.key,required this.pro});
final product pro;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.black87,
          backgroundColor: Colors.white,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black,
              ),
            )
          ]),
      body: cardbody(pro: pro,),
    );
  }
}

class cardbody extends StatelessWidget {
  

  cardbody({super.key,required this.pro});
 product pro;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset(
          pro.image,
          width: MediaQuery.of(context).size.width,
          height: 500,
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * .3),
          child: CartCounter(),
        ),
        const SizedBox(
          height: 30,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: ColorAndSize(),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: BlocConsumer<OrderCubit, OrderState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return CustomButto(
                onPressed: () {
                  BlocProvider.of<OrderCubit>(context).order(pro,i);
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>order()));
                 
                },
                str: 'add to cart',
              );
            },
          ),
        )
      ],
    );
  }
}

class ColorAndSize extends StatefulWidget {
  const ColorAndSize({
    super.key,
  });

  @override
  State<ColorAndSize> createState() => _ColorAndSizeState();
}

class _ColorAndSizeState extends State<ColorAndSize> {
  bool iss = false;
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Color"),
              Row(
                children: <Widget>[
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(
                    color: Color(0xFFF8C078),
                    isSelected: true,
                  ),
                  ColorDot(color: Color(0xFFA29B9B), isSelected: false),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Size"),
              Row(
                children: <Widget>[
                  Rectangle(text: "l", isSelected: true),
                  Rectangle(text: "xl", isSelected: false),
                  Rectangle(text: "xxl", isSelected: false),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20 / 4,
        right: 20 / 2,
      ),
      padding: EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
int i=1;
class CartCounter extends StatefulWidget {
  @override
  _CartCounterState createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                     i=numOfItems;  
                  });
                }
              });
            },
            child: Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20 / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                numOfItems++;
                i=numOfItems;
              });
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}

class Rectangle extends StatefulWidget {
  const Rectangle({Key? key, required this.text, required this.isSelected})
      : super(key: key);

  final String text;
  final bool isSelected;

  @override
  State<Rectangle> createState() => _RectangleState();
}

class _RectangleState extends State<Rectangle> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    Color borderColor = _isTapped ? Colors.blue : Colors.transparent;
    Color backgroundColor = _isTapped ? Colors.blue : Colors.transparent;
    Color textColor = _isTapped ? Colors.white : Colors.black;

    return GestureDetector(
      onTap: () {
        setState(() {
          _isTapped = !_isTapped;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 20 / 4,
          right: 20 / 2,
        ),
        padding: EdgeInsets.all(2.5),
        height: 24,
        width: 48, // Adjust the width as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              4), // Set the border radius to create a rectangle shape
          border: Border.all(
            color: borderColor,
          ),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
