import 'package:campo_minado/models/campo.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Campo', () {
    test('Abrir campo COM Explosao', () {
      Campo campo = Campo(linha: 0, coluna: 0);
      campo.minar();

      expect(campo.abrir, throwsException);
    });

    test('Abrir campo SEM Explosao', () {
      Campo campo = Campo(linha: 0, coluna: 0);
      campo.abrir();

      expect(campo.aberto, isTrue);
    });

    test('Adicionar NÃO Vizinho', () {
      Campo campo1 = Campo(linha: 0, coluna: 0);
      Campo campo2 = Campo(linha: 1, coluna: 3);
      campo1.adicionarVizinho(campo2);

      expect(campo1.vizinhos.isEmpty, isTrue);
    });

    test('Adicionar Vizinho', () {
      Campo campo1 = Campo(linha: 0, coluna: 0);
      Campo campo2 = Campo(linha: 1, coluna: 1);
      Campo campo3 = Campo(linha: 1, coluna: 0);
      campo1.adicionarVizinho(campo2);
      campo1.adicionarVizinho(campo3);

      expect(campo1.vizinhos.length, 2);
    });

    test('Minas na Vizinhança', () {
      Campo campo1 = Campo(linha: 0, coluna: 0);
      Campo campo2 = Campo(linha: 1, coluna: 1);
      campo2.minar();
      Campo campo3 = Campo(linha: 1, coluna: 0);
      campo1.adicionarVizinho(campo2);
      campo1.adicionarVizinho(campo3);

      expect(campo1.quantidadeMinasNaVizinhanca, 1);
    });
  });
}
