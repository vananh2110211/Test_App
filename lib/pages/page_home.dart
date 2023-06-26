import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_application_1/libraries/salomon_bottom_bar.dart';
import 'package:test_application_1/pages/page_detail.dart';
import 'package:test_application_1/libraries/draggable_home.dart';
import 'package:test_application_1/pages/page_intro.dart';
import 'package:test_application_1/pages/page_search.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<dynamic> products;
  late List<dynamic> filteredProducts;
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    filteredProducts = [];
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final productsJson = await rootBundle.loadString('assets/products.json');
    setState(() {
      products = json.decode(productsJson);
      filteredProducts = products;
    });
  }

  void filterProducts(String query) {
    setState(() {
      searchTerm = query;
      filteredProducts = products
          .where((product) =>
              product['name'].toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      leading: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => page_intro())),
          child: Icon(Icons.arrow_back_ios)),
      title: Image.network(
          'https://bka.hcmut.edu.vn/assets/images/logo/logo-bka.png',
          fit: BoxFit.cover,
          height: 55),
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => page_search()));
            },
            icon: const Icon(Icons.search)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [
        Container(
          child: SalomonBottomBar(
            // currentIndex: _currentIndex,
            // onTap: (i) => setState(() => _currentIndex = i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.auto_awesome_motion_outlined),
                title: Text("Products"),
                selectedColor: Colors.blueAccent,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite_border),
                title: Text("Likes"),
                selectedColor: Colors.pink,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.history),
                title: Text("History"),
                selectedColor: Colors.yellow,
              ),

              /// Cart
              SalomonBottomBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text("Cart"),
                selectedColor: Colors.orange,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.filter_alt_outlined),
                title: Text("Sort"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        ),
        Text("Products",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              color: Colors.black87,
            )),
        SizedBoxView(context),
      ],
      fullyStretchable: true,
      //expandedBody: const CameraPreview(),
      backgroundColor: Colors.white,
      appBarColor: Color.fromARGB(255, 255, 255, 255),
    );
  }

  Row headerBottomBarWidget() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page_intro(),
              )),
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              Icons.home,
              color: Color.fromARGB(255, 59, 59, 59),
            ),
          ),
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    return Container(
      color: Color.fromARGB(164, 0, 140, 255),
      child: Center(
        child: Slideshow(),
      ),
    );
  }
  /*Widget x(BuildContext context) {
    double x = MediaQuery.of(context).size.width;
    return Container (
      child: 
    );  
  }*/

  ListView Slideshow() {
    return ListView(
      children: <Widget>[
        Container(
          height: 200,
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://static-images.vnncdn.net/files/publish/2022/6/13/antutu-smartphone-171.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://genk.mediacdn.vn/139269124445442048/2023/3/30/image7-16801558742621304005333-1680160381467-16801603826211813097554.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //SizedBox View() {
  Widget SizedBoxView(BuildContext context) {
    var x = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 1000,
      child: GridView.builder(
          padding: EdgeInsets.all(5),
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: x ~/ 150,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.2,
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => page_detail(
                            product: filteredProducts[index],
                          ))),
              child: Container(
                height: 300,
                width: 150,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 230, 230, 230),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        child: Image.network(
                          filteredProducts[index]['image'],
                          height: 60,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        filteredProducts[index]['name'],
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          child: Row(children: [
                            Text(filteredProducts[index]['rating'].toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                )),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ]),
                        ),
                        Spacer(),
                        Text(
                            ('Đã bán: ' +
                                filteredProducts[index]['sold'].toString()),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                                '\$' +
                                    filteredProducts[index]['price'].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                )),
                            Text(
                                '\$' +
                                    filteredProducts[index]['oldprice']
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue,
                                  decoration: TextDecoration.lineThrough,
                                )),
                          ],
                        ),
                        Spacer(),
                        Container(
                            color: Colors.white,
                            child: Text(
                              'Giảm ' +
                                  (100 -
                                          (filteredProducts[index]['price'] *
                                              100 ~/
                                              filteredProducts[index]
                                                  ['oldprice']))
                                      .toString() +
                                  '%',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(137, 252, 6, 6)),
                            )),
                      ],
                    ),
                    SizedBox(height: 5),
                    Expanded(
                      child: Text(
                        filteredProducts[index]['description'],
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
