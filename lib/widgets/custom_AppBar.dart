import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget implements PreferredSize {
  @override
  Widget get child => throw UnimplementedError();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final Widget leadingicon;
  final String title;
  final Widget actionIcon;
  const CustomAppbar({
    super.key,
    required this.actionIcon,
    required this.title,
    required this.leadingicon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: SizedBox.shrink(),
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          actionIcon,
          Text(title , style: TextStyle(fontWeight: FontWeight.bold),),
          leadingicon ,
        ],
      ),
    );
  }
}
