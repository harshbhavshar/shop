import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import 'package:shop/pages/Login/login.dart';
import 'package:shop/pages/homepage.dart';
import 'package:woocommerce/woocommerce.dart';

String baseUrl = 'http://onlineshop.drharishukla.com';
String consumerKey = 'ck_b3dfc192e4a7af073b10174a82b22744ff6b8af4';
String consumerSecret = 'cs_36ab7cc6954d5c89675565a17c5c2200942ec386';

class Signing extends StatefulWidget {
  const Signing({Key? key}) : super(key: key);

  @override
  State<Signing> createState() => _SigningState();
}

class _SigningState extends State<Signing> {
  TextEditingController uname = TextEditingController();
  TextEditingController pass = TextEditingController();
  WooCommerce wooCommerce = WooCommerce(baseUrl: baseUrl, consumerKey: consumerKey, consumerSecret: consumerSecret);
  addUser()async{
    String username = uname.text.trim();
    String password = pass.text.trim();
    try{
     // WooCustomer wooCustomer = WooCustomer(username:username,password: password);
      final result = wooCommerce.loginCustomer(username: username, password: password);
       //Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) {
              return Homepage();
            }
        ),
      );

      return result;
    } on WooCommerceError catch(e){
      print(e.code.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              TextField(
                controller: uname,
              ),
              TextField(
                controller: pass,
              ),
              ElevatedButton(onPressed: (){
                addUser();
              }, child: Text("click")),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              }, child: Text("click"))

            ],
          ),
        ),
      ),
    );
  }
}
