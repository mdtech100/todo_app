import 'package:flutter/material.dart';
import 'package:todo_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  //Méthodes pour save et cancel une tache
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[300],
      content: Container(
        height: 120,
        width: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user Input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Ajouter une nouvelle tâche'),
            ),

            // 2 boutons --> Sauvegarde et Annulation
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Bouton de sauvegarde
                MyButton(textName: "Sauvegarder", onPressed: onSave),

                const SizedBox(width: 8),

                // Bouton pour annuler
                MyButton(textName: "Annuler", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
