import 'package:flutter/material.dart';
import 'package:test_application_1/pages/page_home.dart';
import 'package:carousel_slider/carousel_slider.dart';

class page_intro extends StatelessWidget {
  const page_intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: <Widget>[
            const SizedBox(width: 5),
            // ElevatedButton(
            //   onPressed: () { },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.white,
            //     foregroundColor: Colors.black,
            //   ),
            //   child: const Row (
            //     children: [
            //       Icon(Icons.chevron_left),
            //       Text('Quay lại', style: TextStyle(fontSize: 16))
            //     ]
            //   ),
            // ),
            Spacer(),
            Flexible(
              child: Image.network(
                'https://bka.hcmut.edu.vn/assets/images/logo/logo-bka.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyHomePage();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.house_outlined,
                  size: 30, color: Colors.black),
            ),
            const SizedBox(width: 5),
          ],
        ),
        body: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
                decoration: InputDecoration(
              filled: false,
              fillColor: Colors.white,
              hoverColor: Colors.grey,
              hintText: 'Tìm kiếm đặc quyền',
              prefixIcon: const Icon(Icons.search),
            )),
          ),
          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return MyHomePage();
                  },
                ),
              );
            },
            child: Container(
              child: Column(children: [
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text('Sản phẩm và dịch vụ đặc quyền',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      Spacer(),
                      SizedBox(
                          width: 20,
                          child: Icon(Icons.arrow_forward_ios, size: 20)),
                    ],
                  ),
                ),
                CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://genk.mediacdn.vn/139269124445442048/2021/4/21/photo-1-16189398046231706741295.jpg'),
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
                    )),
              ]),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Text('Chương trình hướng dẫn nghề nghiệp',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Spacer(),
                    SizedBox(
                        width: 30,
                        child: Icon(Icons.arrow_forward_ios, size: 20)),
                  ],
                ),
              ),
              CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://hcmut.edu.vn/img/news/56192946.jpg?t=56192946'),
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
                              'https://enijobs.com/wp-content/uploads/2022/10/BK-Career-Fair-2022-EniJobs.png'),
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
                  )),
            ]),
          ),
          SizedBox(height: 20),
          Container(
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Text('Chương trình huấn luyện khởi nghiệp',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Spacer(),
                    SizedBox(
                        width: 30,
                        child: Icon(Icons.arrow_forward_ios, size: 20)),
                  ],
                ),
              ),
              CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://hcmut.edu.vn/img/news/q7xd-S5gex4ewRR0Nms4YpbA.jpg'),
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
                              'https://mba-mci.edu.vn/wp-content/uploads/2018/01/BKU-Innovation-Banner_Banner-web-HCMUT.jpg'),
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
                  )),
            ]),
          ),
          SizedBox(height: 20),
          Container(
            child: Column(children: [
              Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Text('Kêu gọi hỗ trợ nghiên cứu/ khởi nghiệp',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Spacer(),
                    SizedBox(
                        width: 30,
                        child: Icon(Icons.arrow_forward_ios, size: 20)),
                  ],
                ),
              ),
              CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://oisp.hcmut.edu.vn/wp-content/uploads/2015/10/images_Hoang_Yen__Marketing_Vuon-uom-doanh-nghiep_DH-Bach-Khoa_03.jpg'),
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
                              'https://hcmut.edu.vn/img/news/vBEAaqTfRb2l7dEnQ0Rq_O-z.jpg'),
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
                  )),
            ]),
          )
        ]));
  }
}