import 'package:flutter/material.dart';
import 'pages/game.dart';
import 'pages/home_page.dart';
import 'partida/configurar_partida.dart';
import 'partida/partida.dart';
import 'package:provider/provider.dart';

void main() {
  final partida = configutarPartida();
  runApp(
    MyApp(
      partida: partida,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.partida}) : super(key: key);
  final Partida partida;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => partida,
      child: MaterialApp(
        title: 'Social link',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': ((context) => const HomePage()),
          '/game': ((context) => const Game()),
        },
      ),
    );
  }
}
