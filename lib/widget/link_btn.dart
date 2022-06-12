import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkBtn extends StatefulWidget {
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
  State<LinkBtn> createState() => _LinkBtnState();
}

class _LinkBtnState extends State<LinkBtn> {
  double dx = 4;
  double dy = 7;

  void _onTap() {
    setState(() {
      dx = 0;
      dy = 0;
    });
    Future.delayed(const Duration(milliseconds: 100), (() {
      setState(() {
        dx = 4;
        dy = 7;
      });
    }));
    widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: widget.color ?? Colors.red,
              border: Border.all(color: Colors.black, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 1,

                  offset: Offset(dx, dy), // changes position of shadow
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
                    widget.icon,
                    color: widget.colorIcon,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.title,
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
