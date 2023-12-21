import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class acount extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    
body: accountbody() ,
   );
  }}
class accountbody extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return  Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children:  [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *.20,vertical: 50),
        child:const CircleAvatar(radius: 100, backgroundImage: AssetImage("assset/images/icons/R.png",),),
        
      ),
     
      Info(text: 'nnn',),
      Info(text: 'nnn',),
      Info(text: ',,mmm',), 
      SizedBox(height: 15,),
      CustomButton(
  text: 'Edit',
  onPressed: () {
    // Add your button press logic here
  },
)
    ],
  ); 
  }

}
class Info extends StatelessWidget {
  final String text;

  Info({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        readOnly: true, // Set the TextField as read-only
        controller: TextEditingController(text: text), // Set the text value
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFFC12F),), // Set background color
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 20,fontFamily: 'font',color: Colors.black87)), // Set text style
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(horizontal :MediaQuery.of(context).size.width*.3,vertical: 15)), // Set padding
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4), // Set rounded corners
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

