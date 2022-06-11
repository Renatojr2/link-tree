import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red, width: 3),
              borderRadius: BorderRadius.circular(100)),
          child: const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/image/perfil.jpg'),
          ),
        ),
        const SizedBox(height: 15),
        const Text(
          'Desenvolvedor Flutter',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
