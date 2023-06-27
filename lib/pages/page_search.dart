import 'package:flutter/material.dart';
import 'page_home.dart';

class page_search extends StatelessWidget {
  final dynamic product;
  const page_search({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            height: 500,
            child: Column(
              children: <Widget>[
                TextField(
                 // onChanged: (value) => product(value),
                  decoration: InputDecoration(
                    hintText: 'Search products',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
