import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/dao/contato_dao.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _numeroContaController = TextEditingController();

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar contato'),
      ),
      body: Column(
        children: [
          Editor(
            controller: widget._nomeController,
            rotulo: 'Nome Completo',
            tipo: TextInputType.name,
          ),
          Editor(
            controller: widget._numeroContaController,
            rotulo: 'Número da conta',
            dica: '0000',
            tipo: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('Confirmar'),
                onPressed: () {
                  final String nome = widget._nomeController.text;
                  final int numeroConta =
                      int.tryParse(widget._numeroContaController.text);
                  final Contato contato = Contato(0, nome, numeroConta);
                  _dao.save(contato).then((id) => Navigator.pop(context));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
