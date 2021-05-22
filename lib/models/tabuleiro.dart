import 'dart:math';

import 'package:campo_minado/models/campo.dart';
import 'package:flutter/cupertino.dart';

class Tabuleiro {
  final int linhas;
  final int colunas;
  final int quantidadeBombas;

  final List<Campo> _campos = [];

  Tabuleiro({
    @required this.linhas,
    @required this.colunas,
    @required this.quantidadeBombas,
  }) {
    _criarCampos();
    _relacionarVizinhos();
    reiniciar();
  }

  void reiniciar() {
    _campos.forEach((campo) => campo.reiniciar());
    _sortearMinas();
  }

  void revelarBombas() {
    _campos.forEach((campo) => campo.revelarBomba());
  }

  void _criarCampos() {
    for (int linha = 0; linha < linhas; linha++) {
      for (int coluna = 0; coluna < colunas; coluna++) {
        _campos.add(Campo(linha: linha, coluna: coluna));
      }
    }
  }

  void _relacionarVizinhos() {
    for (Campo campo in _campos) {
      for (Campo vizinho in _campos) {
        campo.adicionarVizinho(vizinho);
      }
    }
  }

  void _sortearMinas() {
    int minasSorteados = 0;

    if (quantidadeBombas > linhas * colunas) {
      return;
    }

    while (minasSorteados < quantidadeBombas) {
      int i = Random().nextInt(_campos.length);

      if (!_campos[i].minado) {
        minasSorteados++;
        _campos[i].minar();
      }
    }
  }

  List<Campo> get campos {
    return _campos;
  }

  bool get resolvido {
    return _campos.every((campo) => campo.resolvido);
  }
}
