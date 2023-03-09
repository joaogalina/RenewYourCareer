import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';
import './resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': ['Azul', 'Amarelo', 'Vermelho', 'Roxo']
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': ['Corvo', 'Capivara', 'Puma', 'Esquilo']
    },
    {
      'texto': 'Qual o seu amigo favorito?',
      'respostas': ['Marcos', 'Paulo', 'Wagner', 'Gabriela']
    }
  ];

  void _responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
      });
    }
  }

  get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    var respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]
            .cast()['respostas']
            .map((t) => Resposta(t, _responder))
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(_perguntas, _perguntaSelecionada, respostas)
            : Resultado("Parabéns!!!"),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
