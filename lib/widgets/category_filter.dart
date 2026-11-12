import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/svg.dart';

class CategoryFilter extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Text(
              "sort by",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Gap(15),
            SvgPicture.asset("assets/img/Icon/arrow_top_down.svg"),
            Spacer(),
            SvgPicture.asset("assets/img/Icon/filtter.svg"),
            Gap(7),
            Text(
              "Filder",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Gap(12),
            SvgPicture.asset("assets/img/Icon/grid.svg"),
            Gap(12),
            SvgPicture.asset("assets/img/Icon/person.svg"),
          ],
        ),
      ),
    );
  }
}
