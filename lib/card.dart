import 'package:flutter/material.dart';

class card extends StatelessWidget {
  final String img;
  final String name;
  final String price;
  final String rate;
  final String rateCount;
  final Function() ontap;
  final Widget icon ;

  const card({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.rate,
    required this.rateCount,
    required this.ontap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(7),
              width: 145,
              height: 120,

              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Image.asset(img, fit: BoxFit.cover, width: 120),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: ontap,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: icon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, size: 30, color: Colors.amber),
                      SizedBox(width: 5),
                      Text(rate, style: TextStyle(fontSize: 17)),
                      SizedBox(width: 3),
                      Text(rateCount, style: TextStyle(fontSize: 17)),
                    ],
                  ),
                  SizedBox(height: 2),
                  Text(
                    "\$ $price",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
