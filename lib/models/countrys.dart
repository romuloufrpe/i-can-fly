import 'package:flutter/material.dart';

//class Character
class Countrys {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Countrys({this.name, this.imagePath, this.description, this.colors});
}

List countrys = [
  Countrys(
      name: "Portugal",
      imagePath: "assents/images/portugal.png",
      description:
          "Portugal é um país no sul da Europa, localizado na Península Ibérica, que faz fronteira com a Espanha. Sua localização às margens do Oceano Atlântico influenciou muitos aspectos da cultura do país: o bacalhau salgado e as sardinhas assadas são pratos típicos nacionais, as praias do Algarve são destinos muito procurados e boa parte da arquitetura do país data dos séculos XVI a XIX, quando Portugal era um poderoso império marítimo. ",
      colors: [Colors.red, Colors.green]),
  Countrys(
      name: "Brasil",
      imagePath: "assents/images/brasil.png",
      description:
          "O Brasil, um vasto país sul-americano, estende-se da Bacia Amazônica, no norte, até os vinhedos e as gigantescas Cataratas do Iguaçu, no sul. O Rio de Janeiro, simbolizado pela sua estátua de 38 metros de altura do Cristo Redentor, situada no topo do Corcovado, é famoso pelas movimentadas praias de Copacabana e Ipanema, bem como pelo imenso e animado Carnaval, com desfiles de carros alegóricos, fantasias extravagantes e samba.",
      colors: [Colors.yellow, Colors.green]),
  Countrys(
      name: "Estados Unidos",
      imagePath: "assents/images/bandeira-eua.png",
      description:
          "Os EUA são um país com 50 estados que cobrem uma vasta faixa da América do Norte, com o Alasca ao noroeste e o Havaí no Oceano Pacífico, estendendo a presença do país. As principais cidades da costa atlântica são Nova York, um centro financeiro e cultural global, e a capital, Washington, DC. Chicago, uma metrópole do centro-oeste, é conhecida por sua importante arquitetura, enquanto Los Angeles, na costa oeste, é famosa pelas produções cinematográficas de Hollywood",
      colors: [Colors.blue, Colors.red]),
];
