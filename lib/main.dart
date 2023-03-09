import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';
import 'package:projeto_perguntas/resposta.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  int _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      'texto': 'Qual a sua cor favorita?',
      'respostas': [
        {'texto': 'Azul', 'valor': 8},
        {'texto': 'Amarelo', 'valor': 5},
        {'texto': 'Vermelho', 'valor': 7},
        {'texto': 'Roxo', 'valor': 10},
      ],
    },
    {
      'texto': 'Qual o seu animal favorito?',
      'respostas': [
        {'texto': 'Corvo', 'valor': 10},
        {'texto': 'Capivara', 'valor': 8},
        {'texto': 'Esquilo', 'valor': 7},
        {'texto': 'Puma', 'valor': 5},
      ],
    },
    {
      'texto': 'Qual a sua estação do ano favorito?',
      'respostas': [
        {'texto': 'Verão', 'valor': 5},
        {'texto': 'Outono', 'valor': 8},
        {'texto': 'Inverno', 'valor': 10},
        {'texto': 'Primavera', 'valor': 7},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_pontuacaoTotal);
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    var respostas = temPerguntaSelecionada
        ? _perguntas[_perguntaSelecionada]
            .cast()['respostas']
            .map((resp) {
              return Resposta(resp['texto'], () => _responder(resp['valor'])); //para passar função com parametros como paramentro para outra, precisa criar arr func e chamar a função dentro 
            })
        : [];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(_perguntas, _perguntaSelecionada, respostas)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
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
