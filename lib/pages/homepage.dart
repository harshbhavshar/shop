import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:shop/profile/myprofile.dart';

import '../Products/fproduct.dart';
import '../Products/home.dart';
import '../Products/new_arrivals.dart';

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _index = 0;
  List Page=[
    Home(),
    Fproduct(),
    new_arrivals(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
          appBar:PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                centerTitle: true,
                title: Image.asset("assets/Logo1.png",width: 190,),
                automaticallyImplyLeading: false, // hides leading widget
                // flexibleSpace: Image.asset("assets/Logo1.png",width: 40,),
              )
          ),
          // AppBar(
          //
          // ),
          body: Page[_index],
          bottomNavigationBar: GNav(
              selectedIndex: _index,
              onTabChange: (index)=>setState((){
                _index = index;
              }),
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.star,
                  text: 'Featured',
                ),
                GButton(
                  icon: LineIcons.leaf,
                  text: 'New',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                )
              ]
          ),
        );
  }
}


