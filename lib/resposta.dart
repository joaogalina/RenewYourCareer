import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String label;
  final void Function() selecionado;

  Resposta(this.label, this.selecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(45,0,45,0),
      child: ElevatedButton(
        child: Text(this.label), 
        onPressed: selecionado,
      )
    );
  }
}