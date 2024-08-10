import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/dialog_box.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Faire référence à notre Boîte Hive
  final _myBox = Hive.box('myBox');

  //Objet db de la classe TodoDataBase pour pouvoir accéder à la liste des tâches
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    // Si c'est la 1ère fois de lancer l'Application(Encore rien ajouter dans la bddd), veuiller à créer (afficher) les données initiales par défaut
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // Si ce n'est pas la 1ère fois, dans ce cas, des données existent déjà dans la bdd
      db.loadData();
    }

    // TODO: implement initState
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // Liste des tâches
  // List todoList = [
  //   ['Make tutorial', false],
  //   ['Do Exercices', false],
  // ];

  // état checkbox change
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  //Méthode pour enregistrer une nouvelle tâche
  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // Créer une nouvelle tâche
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context)
                .pop, // ANNULER LA TACHE , Donc juste fermer la boîte de dialogue.
          );
        });
  }

  // Delete Task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'TO DO APP',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
