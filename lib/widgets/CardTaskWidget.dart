import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/task_model.dart';
import 'package:segunda_aplicacion/screens/add_task.dart';

/*class CardTaskWidget extends StatelessWidget {
  CardTaskWidget({super.key, required this.taskModel});

  TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Column(
          children: [
            Text(taskModel.idTask.toString()),
            Text(taskModel.nameTask.toString())
          ],
        ),
        Column(
          children: [
            Text(taskModel.dscTask.toString()),
            Text(taskModel.sttTask.toString())
          ],
        )
      ]),
    );
  }
}*/
class CardTaskWidget extends StatelessWidget {
  CardTaskWidget({super.key, required this.taskModel, this.agendaDB});

  TaskModel taskModel;
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
            children: [Text(taskModel.nomTask!), Text(taskModel.desTask!)],
          ),
          IconButton(
              onPressed: () {
                agendaDB!
                    .UPDATE4('tblTask', {'realizada': 2}, 'idTask',
                        taskModel.idTask!)
                    .then((value) {
                  GlobalValues.flagPR4Task.value =
                      !GlobalValues.flagPR4Task.value;
                  var msj = (value > 0)
                      ? 'La actualización fue exitosa'
                      : 'Ocurrió un error';
                  var snackbar = SnackBar(content: Text(msj));
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  Navigator.pop(context);
                });
              },
              icon: Icon(Icons.check_circle)),
          Expanded(
            child: Container(),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddTask(taskModel: taskModel))),
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
                                      .DELETE4('tblTask', 'idTask',
                                          taskModel.idTask!)
                                      .then((value) {
                                    Navigator.pop(context);
                                    GlobalValues.flagTask.value =
                                        !GlobalValues.flagTask.value;
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
