import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/tarea_model.dart';
import 'package:segunda_aplicacion/screens/add_tarea.dart';

class CardTareaWidget extends StatelessWidget {
  CardTareaWidget({super.key, required this.tareaModel, this.agendaDB});

  TareaModel tareaModel;
  AgendaDB? agendaDB;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Column(
            children: [
              Text(tareaModel.nombreTarea!),
              Text(tareaModel.descTarea!)
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddTarea(tareaModel: tareaModel))),
                child: Image.asset('assets/icon_orange.png', height: 50),
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Mensaje del sistema'),
                          content: Text('¿Deseas borrar la tarea?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  agendaDB!
                                      .DELETE('tblTareas', tareaModel.idTarea!)
                                      .then((value) {
                                    Navigator.pop(context);
                                    GlobalValues.flagPR4Task.value =
                                        !GlobalValues.flagPR4Task.value;
                                  });
                                },
                                child: Text('Si')),
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('No')),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}
