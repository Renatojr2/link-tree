import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:insta/partida/configurar_partida.dart';
import 'package:insta/partida/partida.dart';
import 'package:insta/widget/opcoes.dart';
import 'package:provider/provider.dart';

import '../partida/resultado.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  bool jogando = true;
  late Resultado resultado;
  late String mensagem = '';

  void mostrarResultado(Resultado resultado) {
    switch (resultado.resultadoType) {
      case ResultadoType.empate:
        setState(() {
          mensagem = 'Empatou..';
        });
        break;
      case ResultadoType.vitoria:
        setState(() {
          mensagem = 'Você ganhou :D';
        });
        break;
      case ResultadoType.derrota:
        setState(() {
          mensagem = 'Você perdeu :/';
        });
        break;
    }
  }

  void _play(String opcao) {
    final partida = Provider.of<Partida>(context, listen: false);
    if (jogando) {
      resultado = partida.iniciar(humano: opcao);
      setState(() {
        jogando = false;
        mostrarResultado(resultado);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Vamos jogar!',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ecolha um:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: opcoes
                      .map((e) => Opcoes(
                            opcao: e,
                            onTap: () {
                              _play(e);
                            },
                          ))
                      .toList(),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                mensagem,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              if (!jogando)
                TextButton(
                  onPressed: (() {
                    setState(() {
                      jogando = true;
                      mensagem = '';
                    });
                  }),
                  child: const Text('Jogar novamente'),
                )
            ],
          ),
        ),
      ),
    );
  }
}
