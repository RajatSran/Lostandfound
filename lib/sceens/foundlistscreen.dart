import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './additemscreen.dart';
import '../products.dart';
import 'product_detail_screen.dart';

class FoundListScreen extends StatefulWidget {
  @override
  _FoundListScreenState createState() => _FoundListScreenState();
}

class _FoundListScreenState extends State<FoundListScreen> {
  var _isInit = true;
  var _isLoading = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchandsetproducts().then((_) {
        _isLoading = false;
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'lost and found',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddScreen.routeName);
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Consumer<Products>(
              child: Center(
                child: const Text('no lost items to show'),
              ),
              builder: (ctx, products, ch) => products.items.length <= 0
                  ? ch
                  : ListView.builder(
                      itemCount: products.items.length,
                       itemBuilder: (_, i) => 
                      //Card(
                      //       elevation: 5,
                      //       child: Container(
                      //         height: 200.0,
                      //         child: Row(
                      //           children: <Widget>[
                      //             Container(
                      //               height: 200.0,
                      //               width: 200.0,
                      //               decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.only(
                      //                   bottomLeft: Radius.circular(5),
                      //                   topLeft: Radius.circular(5),
                      //                 ),
                      //                 image: DecorationImage(
                      //                   image: NetworkImage(
                      //                       products.items[i].imageurl),
                      //                 ),
                      //               ),
                      //             ),
                      //             Container(
                      //               height: 150,
                      //               child: Padding(
                      //                 padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                      //                 child: Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: <Widget>[
                      //                     Text(
                      //                       products.items[i].title,
                      //                     ),
                      //                     Container(
                      //                       width: 30,
                      //                       decoration: BoxDecoration(
                      //                         border: Border.all(
                      //                             color: Colors.teal),
                      //                         borderRadius: BorderRadius.all(
                      //                             Radius.circular(10)),
                      //                       ),
                      //                       // child: Text(
                      //                       //   products.items[i].description,
                      //                       //   textAlign: TextAlign.center,
                      //                       // ),
                      //                     ),
                      //                     Padding(
                      //                       padding:
                      //                           EdgeInsets.fromLTRB(0, 2, 0, 2),
                      //                       child: Container(
                      //                         width: 260,
                      //                         child: Text(
                      //                           products.items[i].description,
                      //                           style: TextStyle(
                      //                             fontSize: 15,
                      //                             color: Color.fromARGB(
                      //                                 225, 48, 48, 54),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     )
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(products.items[i].imageurl),
                        ),
                        title: Text(products.items[i].title),
                        onTap: () {
                           Navigator.of(context).pushNamed(DetailScreen.routeName);
                        },
                      ),
                      ),
            ),
    );
  }
}
