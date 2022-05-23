import 'package:flutter/material.dart';
import 'package:notes/fonts/colors.dart';

import 'package:notes/views/form.dart';

import 'anotacao.dart';

class ListaAnotacoes extends StatefulWidget {
  final List<Anotacao> _anotacoes = [];

  @override
  State<ListaAnotacoes> createState() => _ListaAnotacoesState();
}

class _ListaAnotacoesState extends State<ListaAnotacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        backgroundColor: MyColors.primary,
      ),
      body: ListView.builder(
          itemCount: widget._anotacoes.length,
          itemBuilder: (context, index) {
            final anotacao = widget._anotacoes[index];
            return ItemAnotacoes(anotacao);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Anotacao?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Formulario();
          }));
          future.then((AnotacaoRecebida) {
            atualiza(AnotacaoRecebida, setState, widget, context);
          });
        },
      ),
    );
  }
}

void atualiza(
    Anotacao? anotacaoRecebida, functionset, widget, BuildContext context) {
  if (anotacaoRecebida != null) {
    functionset(() {
      widget._anotacoes.add(anotacaoRecebida);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {},
        ),
        content: const Text('Adicionado'),
        duration: const Duration(milliseconds: 1500),
        width: 280.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ItemAnotacoes extends StatelessWidget {
  final Anotacao _anotacao;

  ItemAnotacoes(this._anotacao);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.notes),
        title: Text(_anotacao.titulo.toString()),
        subtitle: Text(_anotacao.descricao.toString()),
      ),
    );
  }
}
