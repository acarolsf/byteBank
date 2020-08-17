import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

class FormularioTransferencia extends StatefulWidget{
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double valor = double.tryParse(_controladorValor.text);
    if (numeroConta != null && valor != null) {
      final tranferenciaCriada = Transferencia(numeroConta, valor);
      Navigator.pop(context, tranferenciaCriada);
    }
  }

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Transferência'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Editor(
                controller: widget._controladorNumeroConta,
                dica: '0000',
                rotulo: 'Número da Conta',
                tipo: TextInputType.number,
              ),
              Editor(
                controller: widget._controladorValor,
                dica: '0.00',
                rotulo: 'Valor',
                icone: Icons.monetization_on,
                tipo: TextInputType.number,
              ),
              RaisedButton(
                child: Text('Confirmar'),
                onPressed: () => widget._criaTransferencia(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
