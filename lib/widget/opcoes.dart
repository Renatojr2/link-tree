import 'package:flutter/material.dart';

class Opcoes extends StatelessWidget {
  const Opcoes({Key? key, required this.opcao, this.onTap}) : super(key: key);

  final String opcao;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/image/$opcao.png',
            width: 70,
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
