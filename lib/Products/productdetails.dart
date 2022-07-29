import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Pdetails extends StatefulWidget {
  String? img;
  String? name;
  String? Price;
  String? Details;
  int? no;
   Pdetails({
    required this.name,
    required this.img,
    required this.Details,
    required this.Price,
    required this.no,
});

  @override
  State<Pdetails> createState() => _PdetailsState();
}

class _PdetailsState extends State<Pdetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Color(0xffEEF3F7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40,left: 20,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(onPressed: (){
                    Navigator.pop(context);
                  },backgroundColor: Colors.white,elevation: 2,child: Icon(Icons.chevron_left,color: Color(0xff023b47)),),
                  FloatingActionButton(onPressed: (){},backgroundColor: Colors.white,elevation: 2,child: Icon(LineIcons.shoppingBag,color: Color(0xff023b47)),),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
          Center(child: Image.network(widget.img!,height: 230,)),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.Details!),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Color(0xdbf9f9f9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child:Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius:  BorderRadius.all(Radius.circular(20))
                      ),
                        padding:EdgeInsets.all(8),
                        child: Image.network(widget.img!,width: 60, height: 60,))
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name!,style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text("₹ "+widget.Price!,style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),),
                      ],
                    ),
                    FloatingActionButton(onPressed: (){},child: Icon(LineIcons.addToShoppingCart),backgroundColor: Color(0xff023b47),elevation: 2,)
                  ],
                ),
                elevation: 2,
              ),
            ),
          ],
        ),
      )
    );
  }
}
