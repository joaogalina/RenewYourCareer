import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';

class Questionario extends StatelessWidget {
  final questoes;
  final questaoSelecionada;
  final respostas;
  Questionario(this.questoes, this.questaoSelecionada, this.respostas);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Questao(this.questoes[this.questaoSelecionada]['texto'].toString()),
        ...respostas
      ],
    );
  }
}
