import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_ui/Bar.dart';

import 'package:design_ui/card.dart';
import 'package:design_ui/colors.dart';
import 'package:design_ui/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const new({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "assets/img/slider/slider 1.png",
    "assets/img/slider/slider 2.png",
    "assets/img/slider/slider 3.png",
  ];

  List<catogeryModel> catogry = [
    catogeryModel(img: "assets/img/product/fruits.png", name: "Fruits"),
    catogeryModel(img: "assets/img/product/milk.png", name: "Milk & egg"),
    catogeryModel(img: "assets/img/product/beverages.png", name: "Beverages"),
    catogeryModel(img: "assets/img/product/laundry.png", name: "Laudry"),
    catogeryModel(img: "assets/img/product/vegetable.png", name: "Vegetable"),
  ];

  List<productModel> product = [
    productModel(
      img: "assets/img/card/banana.png",
      name: "Banana",
      price: "3.99",
      rate: "4.8",
      rateCount: "(287)",
    ),
    productModel(
      img: "assets/img/card/Lemon.png",
      name: "Lemon",
      price: "4.99",
      rate: "4.8",
      rateCount: "(287)",
    ),
    productModel(
      img: "assets/img/card/orange.png",
      name: "Orange",
      price: "2.99",
      rate: "4.8",
      rateCount: "(287)",
    ),
    productModel(
      img: "assets/img/card/pepper.png",
      name: "Pepper",
      price: "5.99",
      rate: "4.8",
      rateCount: "(287)",
    ),
    productModel(
      img: "assets/img/card/purex.png",
      name: "purex",
      price: "9.99",
      rate: "4.8",
      rateCount: "(287)",
    ),
  ];

  List<productModel> basketView = [];

  void toggle(productModel product) {
    setState(() {
      if (basketView.contains(product)) {
        basketView.remove(product);
      } else {
        basketView.add(product);
      }
    });
  }

  bool isSelected(productModel product) => basketView.contains(product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bar(),

      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 50,
        leading: SizedBox.shrink(),
        leadingWidth: 0,
        title: Row(
          children: [
            SvgPicture.asset("assets/img/appBar/Vector.svg"),
            SizedBox(width: 8),
            Text("61 Hoopper street.."),
            Icon(Icons.keyboard_arrow_down, size: 25),
            Spacer(),
            Image.asset(
              "assets/img/appBar/basket.png",
              fit: BoxFit.cover,
              width: 25,
              height: 25,
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider.builder(
                itemCount: items.length,
                itemBuilder: (
                  BuildContext context,
                  int itemIndex,
                  int pageViewIndex,
                ) => Image.asset(items[itemIndex]),
                options: CarouselOptions(
                  height: 170,
                  aspectRatio: 1,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(seconds: 3),
                  autoPlayCurve: Curves.linear,
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(catogry.length, (index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 70,
                            height: 70,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,

                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(catogry[index].img),
                          ),
                        ),
                        Text(
                          catogry[index].name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fruits",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "see all",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(product.length, (index) {
                    final item = product[index];
                    return card(
                      img: item.img,
                      name: item.name,
                      price: item.price,
                      rate: item.rate,
                      rateCount: item.rateCount,
                      ontap: () => toggle(item),
                      icon: isSelected(item)
                          ? Icon(Icons.delete_forever_outlined)
                          : Icon(Icons.add),
                    );
                  }),
                ),
              ),

              SizedBox(height: 10),
              basketView.isEmpty
                  ? Text("")
                  : Container(
                      width: double.infinity,
                      height: 85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primary,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 160,
                              child: ListView.builder(
                                itemCount: basketView.length,
                                scrollDirection: Axis.horizontal,

                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          basketView[index].img,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(width: 5),
                            Spacer(),
                            Container(
                              width: 1,
                              height: 45,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),

                            Text(
                              "View Basket",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Badge(
                              backgroundColor: const Color.fromARGB(
                                255,
                                227,
                                15,
                                0,
                              ),
                              label: Text(
                                basketView.length.toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                              child: SvgPicture.asset(
                                "assets/img/appBar/basket2.svg",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
      
    );
  }
}