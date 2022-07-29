import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  stl(double siz,color){
    return TextStyle(
      fontWeight:FontWeight.bold,
      fontSize: siz,
      color: color,
    );
  }
  cds(String t1,String t2,double s1, double s2,Color){
   return Padding(
     padding: const EdgeInsets.all(18.0),
     child: Card(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t1,style: stl(s1,Color)),
              Text(t2,style:stl(s2,Color))
            ],
          ),
        ),
      ),
   );
  }
  sz(double s){
    return SizedBox(
      height: s,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80),
                //set border radius more than 50% of height and width to make circle
              ),
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.red,
                      backgroundImage: AssetImage("assets/image.png"),
                    ),
                    Positioned(child: Card(
                      elevation: 10,
                      child:  Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Icon(LineIcons.alternatePen,color: Colors.red,),
                      ),
                    ),
                      bottom: 0,
                      right: 0,)
                  ],
                ),
              ),
            ),
          ),
          sz(50),
          Text("Harsh Bhavsar",style: stl(40, Colors.black),),
          sz(15),
          Text("@Harsh_Bhavsar",style: stl(25, Color(0xff571adc)
          ),),
          sz(25),
          cds("Total purchases", "250500", 25, 20, Color(0xff023b47)),
          //sz(25),
          cds("Total Product Buy", "2", 25, 20, Color(0xff023b47)),
        ],
      ),
    );
  }
}
