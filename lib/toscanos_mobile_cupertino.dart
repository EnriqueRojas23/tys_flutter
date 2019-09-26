import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tysmobile_flutter/Manifiesto/ui/screens/profile.dart';
import 'package:tysmobile_flutter/Manifiesto/ui/screens/search_order.dart';
import 'package:tysmobile_flutter/Manifiesto/ui/screens/home_manifiesto.dart';

class ToscanosMobileCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search, color: Colors.indigo),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.indigo),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.indigo),
                  title: Text("")
              ),
            ]
        ),

        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchOrden(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context)  =>   HomeManifiesto(),
              );   
              break;
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context)  => Profile(),
                   );
              break;
          }
        },
      ),
    );
  }

}