import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkBtn extends StatelessWidget {
  const LinkBtn({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
    this.color,
    this.colorIcon,
  }) : super(key: key);

  // final Colors colors;
  final String title;
  final String icon;
  final void Function()? onTap;
  final Color? color;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color ?? Colors.red,
              border: Border.all(color: Colors.black, width: 3),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 1,

                  offset: Offset(4, 7), // changes position of shadow
                ),
              ],
            ),
            width: 300,
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon,
                    color: colorIcon,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
