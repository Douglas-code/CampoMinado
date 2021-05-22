import 'package:campo_minado/components/campo_widget.dart';
import 'package:campo_minado/components/resultado_widget.dart';
import 'package:campo_minado/models/campo.dart';
import 'package:campo_minado/models/explosao_exception.dart';
import 'package:flutter/material.dart';

class CampoMinadoApp extends StatelessWidget {
  void _reiniciar() {
    print("teste");
  }

  void _abrir(Campo campo) {
    print("abrir");
  }

  void _alternarMarcacao(Campo campo) {
    print("alternar");
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = new Campo(linha: 1, coluna: 1);
    vizinho1.minar();
    Campo campo = Campo(linha: 0, coluna: 0);
    campo.adicionarVizinho(vizinho1);

    try {
      // campo.minar();
      campo.abrir();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
