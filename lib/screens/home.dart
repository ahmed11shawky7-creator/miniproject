import 'package:design_ui2/model/categories_model.dart';
import 'package:design_ui2/screens/categories.dart';
import 'package:design_ui2/widgets/custom_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const new({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/img/videos/flutter.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      })
      ..setLooping(false);
  }

  List<Categories_model> categories = [
    Categories_model(name: "Women", img: "assets/img/category/image.png"),
    Categories_model(name: "Men", img: "assets/img/category/image (1).png"),
    Categories_model(name: "Kids", img: "assets/img/category/image (2).png"),
    Categories_model(name: "Deals", img: "assets/img/category/image (3).png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leadingicon: SvgPicture.asset("assets/img/Icon/iconBar/menu.svg"),
        title: "Runway",
        actionIcon: SvgPicture.asset("assets/img/Icon/iconBar/bell.svg"),
      ),
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,

            child: Container(
              width: double.infinity,
              height: 170,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10),
                    Text(
                      "catogories",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    Gap(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: List.generate(categories.length, (index){
                      final item = categories[index];
                       return Padding(
                         padding: EdgeInsets.only(right: 15),
                         child: GestureDetector(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (c)=>Category_Screen())),
                          
                           child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.asset(item.img ,width:75,),
                                Gap(8),
                                Text(item.name , style: TextStyle(fontSize: 14 , fontWeight: FontWeight.w600),),
                              ],
                            ),
                         ),
                       );
                          
                      })),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}