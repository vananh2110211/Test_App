import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:test_application_1/library/salomon_bottom_bar.dart';
import 'package:test_application_1/pages/page_detail.dart';
import 'package:test_application_1/library/draggable_home.dart';
import 'package:test_application_1/pages/page_search.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

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
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("BK Alumni"),
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
        SalomonBottomBar(
          // currentIndex: _currentIndex,
          // onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.blueAccent,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.favorite_border),
              title: Text("Likes"),
              selectedColor: Colors.pink,
            ),

            /// Cart
            SalomonBottomBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Cart"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
        Text("Products", style: Theme.of(context).textTheme.headline2!),
        View(),
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
      children: const [
        Icon(
          Icons.settings,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Color.fromARGB(164, 0, 140, 255),
      child: Center(
        child: Slideshow(),
      ),
    );
  }

  ListView Slideshow() {
    return ListView(
      children: <Widget>[
        Container(
          height: 500,
          child: Column(
            children: <Widget>[
              // TextField(
              //   //onChanged: (value) => filterProducts(value),
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(),
              //     icon: Icons.search,
              //     hintText: 'Search products',
              //   ),
              // ),
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
                  viewportFraction: 0.8,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  SizedBox View() {
    return SizedBox(
      height: 600,
      child: GridView.builder(
          padding: EdgeInsets.all(10),
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromARGB(255, 230, 230, 230),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Image.network(
                        filteredProducts[index]['image'] ?? '',
                        height: 64,
                      ),
                    ),
                    Text(
                      filteredProducts[index]['name'] ?? '',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(filteredProducts[index]['description'] ?? ''),
                    Text(filteredProducts[index]['price'] ?? ''),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
