import 'package:bytebank/models/Transferencia.dart';
import 'package:bytebank/screens/transferencia/Formulario.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((tranferenciaCriada) =>
            _atualiza(tranferenciaCriada)
          );
        },
      ),
    );
  }

  void _atualiza(Transferencia tranferenciaCriada) {
    if (tranferenciaCriada != null) {
      setState(() => widget._transferencias.add(tranferenciaCriada));
    }
  }
}
class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transferencia.valor.toString()),
        subtitle: Text(this._transferencia.numeroConta.toString()),
      ),
    );
  }
}