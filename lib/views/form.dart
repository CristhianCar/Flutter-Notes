import 'package:flutter/material.dart';
import 'package:notes/components/editor.dart';
import 'package:notes/fonts/colors.dart';

import 'anotacao.dart';

class Formulario extends StatefulWidget {
  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final TextEditingController _controladorTitulo = TextEditingController();
  final TextEditingController _controladorDescricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        backgroundColor: MyColors.primary,
      ),
      body: Column(
        children: [
          Editor(
              controlador: _controladorTitulo, rotulo: 'Título', dica: 'Tema'),
          Editor(
              controlador: _controladorDescricao,
              rotulo: 'Descrição',
              dica: 'Texto'),
          ElevatedButton(
              onPressed: () {
                criaAnotacao(
                    _controladorTitulo, _controladorDescricao, context);
              },
              child: Text('Criar anotação'))
        ],
      ),
    );
  }
}

void criaAnotacao(campoTitulo, campoDescricao, BuildContext context) {
  final String? titulo = campoTitulo.text;
  final String? descricao = campoDescricao.text;

  if (descricao != null && descricao != null) {
    final anotacaoCriada = Anotacao(titulo, descricao);

    Navigator.pop(context, anotacaoCriada);
  }
}
