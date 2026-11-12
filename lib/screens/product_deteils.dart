import 'package:design_ui2/model/categories_model.dart';
import 'package:design_ui2/screens/categories.dart';
import 'package:design_ui2/widgets/category_filter.dart';
import 'package:design_ui2/widgets/custom_AppBar.dart';
import 'package:design_ui2/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class ProductDeteils extends StatefulWidget {
  final String img;
  final String name;
  final String price;

  const ProductDeteils({
    super.key,
    required this.img,
    required this.name,
    required this.price,
  });

  @override
  State<ProductDeteils> createState() => _ProductDeteilsState();
}

class _ProductDeteilsState extends State<ProductDeteils> {

    List<Categories_model> categories = [
    Categories_model(name: "", img:"assets/img/man/Cloth 1.png" ),
    Categories_model(name: "", img:"assets/img/man/Cloth 2.png" ),
    Categories_model(name: "", img:"assets/img/man/Cloth 3.png" ),
    Categories_model(name: "", img:"assets/img/man/Cloth 4.png" ),
    Categories_model(name: "", img:"assets/img/man/Cloth 5.png" ),
    Categories_model(name: "", img:"assets/img/man/Cloth 6.png" ),
  ];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomSheet();
    });
  }

  ScrollController scrollController = ScrollController();
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (c) {
        return DraggableScrollableSheet(
          initialChildSize: 0.17,
          minChildSize: 0.17,
          maxChildSize: 0.95,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return bottomwidget(scrollController, widget.name, widget.price);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        actionIcon: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset("assets/img/Icon/iconBar/arrow-left.svg"),
        ),
        title: "Men",
        leadingicon: Badge(
          label: Text("0"),
          child: SvgPicture.asset("assets/img/Icon/iconBar/cart.svg"),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryFilter(),
            Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: 250,
                    height: 600,
                    child: Image.asset(widget.img),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Image.asset("assets/img/man/shado.png"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomwidget(scroll, name, price) {
  return Container(
    padding: EdgeInsets.all(10),
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),

    child: ListView(
      controller: scroll,
      children: [
        Center(
          child: Container(
            width: 42,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        Gap(10),
        Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
        Gap(20),
        Row(
          children: [
            Text(
              "£$price",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Icon(Icons.favorite_outline),
            Gap(5),
            Text(
              "450",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select color",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Gap(6),
              SvgPicture.asset("assets/img/Icon/arrow_top_down.svg"),
              Spacer(),
              Container(width: 1, height: 31, color: Colors.grey),
              Spacer(),
              Text(
                "Select size",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Gap(6),
              SvgPicture.asset("assets/img/Icon/arrow_top_down.svg"),
            ],
          ),
        ),
        Gap(10),
        Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              "Add To Bag",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Gap(10),
        Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/img/Icon/bottonSheet/Free delivery.svg",
                    ),
                    Gap(5),
                    Text(
                      "Free delivery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/img/Icon/bottonSheet/Free_return.svg",
                    ),
                    Gap(5),
                    Text(
                      "Free return",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text("View return policy"),
                  ],
                ),
              ],
            ),
          ),
        ),
        Gap(10),
        Text(
          "About product",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Gap(10),
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/img/Icon/bottonSheet/Product details.svg",
                    ),
                    Gap(5),
                    Text(
                      "Product details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/img/Icon/bottonSheet/Brand.svg"),
                    Gap(5),
                    Text(
                      "Brand",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/img/Icon/bottonSheet/Size and fit.svg",
                    ),
                    Gap(5),
                    Text(
                      "Size and fit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                Row(
                  children: [
                    SvgPicture.asset("assets/img/Icon/bottonSheet/History.svg"),
                    Gap(5),
                    Text(
                      "History",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined),
                  ],
                ),
              ],
            ),
          ),
        ),
        Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "You might also like",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            TextButton(
              onPressed: () {
    
                Navigator.pushReplacement(context ,  MaterialPageRoute(builder: (c)=>Category_Screen()));
                    
              },
              child: Text(
                "View all",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
