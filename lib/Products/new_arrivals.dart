import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:woocommerce/models/products.dart';
import 'package:woocommerce/woocommerce.dart';

import 'productdetails.dart';

String baseUrl = 'http://onlineshop.drharishukla.com';
String consumerKey = 'ck_b3dfc192e4a7af073b10174a82b22744ff6b8af4';
String consumerSecret = 'cs_36ab7cc6954d5c89675565a17c5c2200942ec386';
class new_arrivals extends StatefulWidget {
  const new_arrivals({Key? key}) : super(key: key);

  @override
  State<new_arrivals> createState() => _new_arrivalsState();
}

class _new_arrivalsState extends State<new_arrivals> {

  List<WooProduct> products = [];
  WooCommerce wooCommerce = WooCommerce(baseUrl: baseUrl, consumerKey: consumerKey, consumerSecret: consumerSecret);
  getProducts()async{
    products = await wooCommerce.getProducts();
    setState((){});
    print(products.toString());
  }
  @override
  void initState(){
    super.initState();
    getProducts();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          // Text("data"),
          SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 25,left: 15),
                child: Text("New Arrivals",
                  style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff023b47),
                  ),
                ),
              )
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio:0.6,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
            ),

            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                final product = products[index];
                return
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> Pdetails(
                                  img: product.images[0].src,
                                  Price: product.price,
                                  name: product.name, Details: product.description, no: product.id,
                                )));
                          },
                          child: Stack(
                            children: [
                              Padding(padding: EdgeInsets.only(top: 60),
                                child:  Card(
                                  color: Color(0xfff9f9f8),
                                  child: Container(
                                    width: 150,
                                    height: 200,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(product.name?? 'Loading...',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25
                                        ), ),
                                        Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [

                                                  Text("₹ "+product.price, style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 22
                                                  ),)
                                                ],
                                              ),
                                              FloatingActionButton(onPressed: (){},
                                                backgroundColor: Color(0xff023b47),
                                                child: Icon(LineIcons.plus,color: Colors.white,),
                                                elevation: 2,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(product.images[0].src,width: 150,height: 150,),
                              ),
                            ],
                          )
                      ),

                    ],
                  );
              },
              childCount: products.length,
            ),
          )
        ],
      ),
    );
  }
}
