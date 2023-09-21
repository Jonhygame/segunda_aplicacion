import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/models/task_model.dart';

class CardTaskWidget extends StatelessWidget {
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
}
