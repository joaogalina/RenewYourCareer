import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  get fraseResultado {
    if (this.pontuacao <= 17) {
      return "Mais sorte na próxima!!";
    } else if (this.pontuacao <= 19) {
      return "Continue assim!!";
    } else if (this.pontuacao < 30) {
      return "Muito Bom!!";
    } else {
      return "Parabéns!!!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: this.reiniciarQuestionario,
          child: Text(
            "Recomeçar questionário",
            style: TextStyle(fontSize: 22),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade200),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
        )
      ],
    );
  }
}
