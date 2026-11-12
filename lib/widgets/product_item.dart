import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';

class ProductItem extends StatelessWidget {
  final String img;
  final String name;
  final String price;
  final Function()? ontap ; 

  const ProductItem({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap:ontap,
          child: Container(
            width: 200,
            height: 255,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Stack(
                  children: [
                    Center(child: Image.asset(img)),
          
                    Positioned(
                      bottom: 5,
                      left: 10,
                      right: 10,
                      child: Image.asset("assets/img/man/shado.png"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Gap(10),
        Text(name, style: TextStyle(fontSize: 12)),
        Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "£$price",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.favorite_outline),
            ],
          ),
        ),
      ],
    );
  }
}
