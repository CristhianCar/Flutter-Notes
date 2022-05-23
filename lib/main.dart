import 'package:flutter/material.dart';
import 'package:notes/views/lista.dart';

void main() {
  runApp(const Note());
}

class Note extends StatelessWidget {
  const Note({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ListaAnotacoes(),
    );
  }
}
