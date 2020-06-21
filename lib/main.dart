import 'package:flutter/material.dart';
import 'package:metroapp/products.dart';
import 'package:provider/provider.dart';
import './sceens/foundlistscreen.dart';
import './sceens/additemscreen.dart';
import 'package:flutter/widgets.dart';

import 'sceens/product_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Products(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.lightGreen
        ),
        home: FoundListScreen(),
        routes: {
          AddScreen.routeName: (ctx) => AddScreen(),
          DetailScreen.routeName:(ctx)=> DetailScreen(),
        },
      ),
    );
  }
}
