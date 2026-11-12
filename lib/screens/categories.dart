import 'package:design_ui2/model/product_model.dart';
import 'package:design_ui2/screens/product_deteils.dart';
import 'package:design_ui2/widgets/category_filter.dart';
import 'package:design_ui2/widgets/custom_AppBar.dart';
import 'package:design_ui2/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class Category_Screen extends StatefulWidget {
  const Category_Screen({super.key});

  @override
  State<Category_Screen> createState() => _Category_ScreenState();
}

class _Category_ScreenState extends State<Category_Screen> {
  List<ProductModel> product = [
    ProductModel(
      img: "assets/img/man/Cloth 4.png",
      name: "Gray coat and white T-sh..",
      price: "30",
    ),
    ProductModel(
      img: "assets/img/man/Cloth 5.png",
      name: "Top man black with Trous..",
      price: "60",
    ),
    ProductModel(
      img: "assets/img/man/Cloth 1.png",
      name: "Top man black",
      price: "20",
    ),
    ProductModel(
      img: "assets/img/man/Cloth 2.png",
      name: "Deep gray essential regul..",
      price: "50",
    ),
    ProductModel(
      img: "assets/img/man/Cloth 3.png",
      name: "Gray coat and white T-sh..",
      price: "30",
    ),
    ProductModel(
      img: "assets/img/man/Cloth 6.png",
      name: "Gray coat and white T-sh..",
      price: "40",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        actionIcon: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: SvgPicture.asset("assets/img/Icon/iconBar/arrow-left.svg")),
        title: "Men",
        leadingicon: Badge(
          label: Text("0"),
          child: SvgPicture.asset("assets/img/Icon/iconBar/cart.svg"),
        ),
      ),

      body: Column(
        children: [
          CategoryFilter(),
          Gap(15),

          Expanded(
            child: GridView.builder(
              itemCount: product.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                childAspectRatio: 1 / 1.90,
              ),

              itemBuilder: (context, index) {
                final item = product[index];
                return ProductItem(
                  img: item.img,
                  name: item.name,
                  price: item.price,
                  ontap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => ProductDeteils(img: item.img, name: item.name , price: item.price,)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
