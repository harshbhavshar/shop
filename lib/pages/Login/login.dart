import 'package:flutter/material.dart';
import 'package:shop/pages/homepage.dart';
import 'package:woocommerce/woocommerce.dart';

import '../../Woo/woocommerce.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController uname = TextEditingController();
  TextEditingController emails = TextEditingController();
  TextEditingController pass = TextEditingController();
  addUser()async{
    String username = uname.text.trim();
    String email = emails.text.trim();
    String password = pass.text.trim();
   try{
     WooCustomer wooCustomer = WooCustomer(username:username,password: password,email: email);
     final result = wooCommerce.createCustomer(wooCustomer);
    // Navigator.popUntil(context, (route) => route.isFirst);
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
                controller: emails,
              ),
              TextField(
                controller: pass,
              ),
              ElevatedButton(onPressed: (){
                addUser();
              }, child: Text("click"))

            ],
          ),
        ),
      ),
    );
  }
}
