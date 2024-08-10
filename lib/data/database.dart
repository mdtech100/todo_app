import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  List todoList = [];

  // Référencer notre boîte Hive
  final _myBox = Hive.box('myBox');

  // Exécuter cette méthode si c'est la 1ère fois de lancer l'App pour créer(afficher tout simplement) les données intiales
  void createInitialData() {
    todoList = [
      ["Aller au Sport", false],
      ["Faire les courses", false],
    ];
  }

  // Charger (load) les données dans la base de données locale
  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  // Update (Mettre à jour) les données de la bdd. Sera utilisée à chaque fois que l'utilisateur interagit avec la bdd
  void updateData() {
    _myBox.put("TODOLIST", todoList);
  }
}
