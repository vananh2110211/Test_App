import 'package:flutter/material.dart';
import 'package:test_application_1/library/salomon_bottom_bar.dart';

class page_detail extends StatelessWidget {
  final dynamic product;
  const page_detail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Image.network(
            product['image'],
            // height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          // Text(
          //   product['name'],
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
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
                        product['price'],
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
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
                      Icon(Icons.star, size: 20, color: Colors.yellow),
                      Icon(Icons.star, size: 20, color: Colors.yellow),
                      Icon(Icons.star, size: 20, color: Colors.yellow),
                      Icon(Icons.star, size: 20, color: Colors.yellow),
                      Icon(Icons.star, size: 20, color: Colors.yellow),
                      Text('5.0'),
                      SizedBox(width: 15),
                      Text('Đã bán: 1')
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
              "Giảm 38%",
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
            Spacer(),
            Padding(
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
                  "https://www.moneycontroller.co.uk/upload/fondi/azione-abc-company.png",
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(width: 10),
              Text(
                "Công Ty ABC",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
          Spacer(),
          Column(children: [
            ElevatedButton(
                //style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {},
                child: Text(
                  "Xem gian hàng",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
            SizedBox(height: 10),
            ElevatedButton(
                //style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20)),
                onPressed: () {},
                child: Text(
                  "Xem thông tin",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ))
          ])
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
            Text(
              product['description'],
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
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
                Icon(Icons.star, size: 20, color: Colors.yellow),
                Icon(Icons.star, size: 20, color: Colors.yellow),
                Icon(Icons.star, size: 20, color: Colors.yellow),
                Icon(Icons.star, size: 20, color: Colors.yellow),
                Icon(Icons.star, size: 20, color: Colors.yellow),
                Text('5.0'),
                SizedBox(width: 15),
                Text('Đã bán: 1'),
                SizedBox(width: 15),
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
                        IconButton(
                          icon: Icon(Icons.more_vert,
                              size: 20, color: Colors.black),
                          onPressed: () {},
                        )
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
      height: 65,
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
          color: Colors.white54,
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            // width: 81,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(
                Icons.share,
                color: Colors.black87,
                size: 32,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black87,
                size: 32,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50),
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 101, 184),
              borderRadius: BorderRadius.circular(15),
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
}
