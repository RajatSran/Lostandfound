import 'package:flutter/material.dart';
import 'package:metroapp/products.dart';
import 'package:provider/provider.dart';

import '../lostproduct.dart';

class DetailScreen extends StatelessWidget {
  


  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selecteditem =
        Provider.of<Products>(context, listen: false).findBy(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selecteditem.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selecteditem.imageurl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                selecteditem.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
