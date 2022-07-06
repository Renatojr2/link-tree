import 'partida.dart';

Partida configutarPartida() {
  return Partida()
    ..criarRegras(tesoura, acao: 'cortar', perdedor: papel)
    ..criarRegras(tesoura, acao: 'decapita', perdedor: lagarto)
    ..criarRegras(papel, acao: 'cobre', perdedor: pedra)
    ..criarRegras(papel, acao: 'refuta', perdedor: spock)
    ..criarRegras(pedra, acao: 'esmaga', perdedor: lagarto)
    ..criarRegras(pedra, acao: 'quebra', perdedor: tesoura)
    ..criarRegras(lagarto, acao: 'envenena', perdedor: spock)
    ..criarRegras(lagarto, acao: 'come', perdedor: papel)
    ..criarRegras(spock, acao: 'esmaga', perdedor: tesoura)
    ..criarRegras(spock, acao: 'vaporiza', perdedor: pedra);
}
