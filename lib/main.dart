import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
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

    var respostas = perguntas[_perguntaSelecionada].cast()['respostas'].map((t) => Resposta(t,_responder));

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: Column(
          children: [
            Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
            ...respostas
          ],
        ),
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
