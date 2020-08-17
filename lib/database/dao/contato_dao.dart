import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountName INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountName = 'account_name';
  
  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contato.nome;
    contactMap[_accountName] = contato.numeroConta;
    return db.insert(_tableName, contactMap);

    // not async
    // return createDatabase().then((db) {
    //   final Map<String, dynamic> contactMap = Map();
    //   // contactMap['id'] = contato.id;
    //   contactMap['name'] = contato.nome;
    //   contactMap['account_number'] = contato.numeroConta;
    //   return db.insert('contacts', contactMap);
    // });
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase();

    final List<Map<String, dynamic>> result = await db.query(_tableName);
    final List<Contato> contatos = List();
    for (Map<String, dynamic> row in result) {
      final Contato contato = Contato(
        row[_id],
        row[_name],
        row[_accountName],
      );
      contatos.add(contato);
    }
    return contatos;

    // return createDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contato> contatos = List();
    //     for (Map<String, dynamic> map in maps) {
    //       final Contato contato = Contato(
    //         map['id'],
    //         map['name'],
    //         map['account_number'],
    //       );
    //       contatos.add(contato);
    //     }
    //     return contatos;
    //   });
    // });
  }
}
