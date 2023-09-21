import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String dropDownValue = "Pendiente";
  TextEditingController txtConName = TextEditingController();
  TextEditingController txtConDsc = TextEditingController();
  List<String> dropDownValues = ['Pendiente', 'Completado', 'En proceso'];

  AgendaDB? agendaDB;
  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
  }

  @override
  Widget build(BuildContext context) {
    final txtNameTask = TextFormField(
      decoration: InputDecoration(
          label: Text('Nombre de la tarea'), border: OutlineInputBorder()),
      controller: txtConName,
    );
    final txtDscTask = TextFormField(
      decoration: InputDecoration(
          label: Text('Descripcion de tarea'), border: OutlineInputBorder()),
      controller: txtConDsc,
      maxLines: 6,
    );

    final space = SizedBox(
      height: 10,
    );

    final DropdownButton ddBStatus = DropdownButton(
      value: dropDownValue,
      icon: Icon(Icons.star_outline_sharp),
      items: dropDownValues
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) {
        dropDownValue = value;
        setState(() {});
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            space,
            txtNameTask,
            space,
            txtDscTask,
            space,
            ddBStatus,
            ElevatedButton(
                onPressed: () {
                  agendaDB!.INSERT('tbltareas', {
                    'nameTask': txtConName.text,
                    'dscTask': txtConDsc.text,
                    'sttTask': dropDownValue.substring(1, 1)
                  }).then((value) {
                    var msj = (value > 0)
                        ? 'La insercion fue exitosa'
                        : 'Ocurrio un error';
                    var snackBar = SnackBar(content: Text(msj));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.pop(context);
                  });
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}
