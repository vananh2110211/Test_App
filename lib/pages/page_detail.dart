import 'package:flutter/material.dart';
//import 'package:test_application_1/library/salomon_bottom_bar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import "page_home.dart";

class page_detail extends StatelessWidget {
  final dynamic product; 
  const page_detail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.white,
        actions:<Widget> [
            IconButton( 
              icon: Icon(Icons.arrow_back_ios, size: 32, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.shopping_cart, size: 32, color: Colors.black),
              onPressed: () {},
            ),
            PopupMenuButton(
              icon: Icon(Icons.more_vert, size: 32, color: Colors.black),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.share, color: Colors.black, size: 18),
                        SizedBox(width: 5),
                        Text(
                        "Chia sẻ sản phẩm",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.autorenew, color: Colors.black, size: 18),
                        SizedBox(width: 5),
                        Text(
                        "Quay về trang chủ",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  onTap: (){
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.thumb_down, color: Colors.black, size: 18),
                        SizedBox(width: 5),
                        Text(
                        "Báo cáo sản phẩm",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Container(
                    child: Row(
                      children: [
                        const Icon(Icons.contact_support, color: Colors.black, size: 18),
                        SizedBox(width: 5),
                        const Text(
                        "Bạn cần hỗ trợ",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            product['image'],
            // height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          p_options(),
          p_detail(),
          p_deals(),
          p_seller(),
          p_description(),
          p_review(),
        ],
      ),
      bottomNavigationBar: p_bottombar(),
    );
  }

  Container p_options() {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10, bottom: 10),
            child: 
            Text(
              "Phân loại sản phẩm",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
          Row(
            children: [
              Expanded(
                child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(0.5),
                child:
                Row(
                children: [
                  Image.network(
                    product['image'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Image.network(
                    product['image'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Image.network(
                    product['image'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Image.network(
                    product['image'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                  Image.network(
                    product['image'],
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 12),
                 ],
                )
                          ),
              ),
            SizedBox(
              width: 30,
              child: Icon(Icons.arrow_forward_ios, size: 28)),
            ]
          ),
        ],
      ),
    );
  }

  Container p_detail() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 230, 236, 238),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['name'],
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$' + product['price'].toString(),
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 15),
                      Text(
                        '\$' + product['oldprice'].toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 8, 42, 69),
                          decoration: TextDecoration.lineThrough,
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          color: Colors.white,
                          child: const Text('Voucher BKA')),
                      SizedBox(width: 15),
                      Container(
                          color: Colors.white,
                          child: const Text('Lần đầu giảm 45%'))
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      p_rating(),
                      SizedBox(width: 5),
                      Text(product['rating'].toString()),
                      SizedBox(width: 15),
                      Text('Đã bán: ' + product['sold'].toString())
                    ],
                  ),
                  SizedBox(height: 15),
                ],
              )),
        ),
        Spacer(),
        Container(
            color: Colors.white,
            child: Text(
              'Giảm ' + (100 - (product['price']*100 ~/ product['oldprice'])).toString() + '%',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(137, 252, 6, 6)),
            )),
      ]),
    );
  }

  Container p_deals() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 230, 236, 238),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Text(
            "Sản phẩm mua kèm khuyến mãi",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 15),
          Row(children: [
            Container(
              color: Colors.white,
              child: Image.network(
                product['image'],
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(width: 15),
            //Spacer(),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bonus",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'NewPrice',
                            ),
                            SizedBox(width: 15),
                            Text(
                              'OldPrice',
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Text(
                          "*Áp dụng đến hết ngày 11/12/2023",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 15),
                      ],
                    )),
              ),
            ),
          ]),
        ],
      ),
    );
  }

  Container p_seller() {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 230, 236, 238),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                color: Colors.white,
                child: Image.network(
                  product['companyimage'],
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 120,
                child: Text(
                  product['company'],
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              )
            ],
          ),
         // Spacer(),
          Expanded(
            child: Column(children: [
              ElevatedButton(
                  //style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text(
                    "Xem gian hàng",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
              SizedBox(height: 10),
              ElevatedButton(
                  //style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text(
                    "Xem thông tin",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))
            ]),
          )
        ],
      ),
    );
  }

  Container p_description() {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 236, 238),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Text(
              "Chi tiết sản phẩm",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            ReadMoreText(
              product['description'],
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              trimLines: 3,
              colorClickableText: Colors.grey,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Icon(Icons.keyboard_arrow_down, size: 28),
          ],
        ));
  }

  Container p_review() {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 230, 236, 238),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: [
            Text(
              "Đánh giá sản phẩm",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                p_rating(),
                SizedBox(width: 5),
                Text(product['rating'].toString()),
                SizedBox(width: 10),
                Text('Đã bán: ' + product['sold'].toString()),
                SizedBox(width: 10),
                Text('Đã bình luận: 1')
              ],
            ),
            SizedBox(height: 5),
            Container(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.account_circle,
                              size: 30, color: Colors.black),
                          onPressed: () {},
                        ),
                        Text(
                          "Nguyễn Văn A",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                        IconButton(
                          icon: Icon(Icons.thumb_up_alt,
                              size: 20, color: Colors.black),
                          onPressed: () {},
                        ),
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert, size: 20, color: Colors.black),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.message, color: Colors.black, size: 18),
                                    SizedBox(width: 5),
                                    Text(
                                    "Báo cáo bình luận xấu",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 15, top: 0),
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(
                        product['comment'],
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    )
                  ],
                )),
            Icon(Icons.keyboard_arrow_down, size: 28),
          ],
        ));
  }

  Container p_bottombar() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 238, 238),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 111, 205, 249)),
            ),
            child: Center(
              child: Icon(
                Icons.share,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 83, 173, 247)),
            ),
            child: Center(
              child: Icon(
                Icons.add_shopping_cart,
                color: Colors.black,
                size: 32,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            child: Center(
              child: Text("Mua ngay",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Container p_rating() {
    return Container(
      child: RatingBarIndicator(
        rating: product['rating'].toDouble(),
        itemBuilder: (context, index) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        itemCount: 5,
        itemSize: 20.0,
        direction: Axis.horizontal,
      ),
    );
  }


}
