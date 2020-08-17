import 'package:bytebank/screens/contacts/list.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Dashboard';

final List<Botao> botoes = [
  new Botao(name: 'Contatos', page: ContactsList(), icon: Icons.people,),
  new Botao(name: 'Transferências', page: ListaTransferencias(), icon: Icons.monetization_on,),
];

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 110,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ItemDashboard(botao: botoes[0],),
                ItemDashboard(botao: botoes[1],),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemDashboard extends StatelessWidget {

  final Botao botao;
  ItemDashboard({this.botao});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => botao.page));
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  botao.icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  botao.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Botao {
  final String name;
  final Widget page;
  final IconData icon;

  Botao({this.name, this.page, this.icon});
}