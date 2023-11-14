import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/tarea_model.dart';

// ignore: must_be_immutable
class AddTarea extends StatefulWidget {
  AddTarea({super.key, this.tareaModel});

  TareaModel? tareaModel;

  @override
  State<AddTarea> createState() => _AddTareaState();
}

class _AddTareaState extends State<AddTarea> {
  String? dropDownValue = "Pendiente";
  TextEditingController txtConName = TextEditingController();
  TextEditingController txtConDsc = TextEditingController();
  List<String> dropDownValues = ['Pendiente', 'Completado', 'En proceso'];

  AgendaDB? agendaDB;

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
    if (widget.tareaModel != null) {
      txtConName.text = widget.tareaModel!.nombreTarea!;
      txtConDsc.text = widget.tareaModel!.descTarea!;
      switch (widget.tareaModel!.estadoTarea) {
        case 'E':
          dropDownValue = "En proceso";
          break;
        case 'C':
          dropDownValue = "Completo";
          break;
        case 'P':
          dropDownValue = "Pendiente";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtNameTask = TextFormField(
      decoration: const InputDecoration(
          label: Text('Tarea'), border: OutlineInputBorder()),
      controller: txtConName,
    );

    final txtDscTask = TextFormField(
      decoration: const InputDecoration(
          label: Text('Descripción'), border: OutlineInputBorder()),
      maxLines: 6,
      controller: txtConDsc,
    );

    const space = SizedBox(
      height: 10,
    );

    final DropdownButton ddBStatus = DropdownButton(
        value: dropDownValue,
        items: dropDownValues
            .map((status) =>
                DropdownMenuItem(value: status, child: Text(status)))
            .toList(),
        onChanged: (value) {
          dropDownValue = value;
          setState(() {});
        });

    final ElevatedButton btnGuardar = ElevatedButton(
        onPressed: () {
          if (widget.tareaModel == null) {
            agendaDB!.INSERT('tblTareas', {
              'nombreTarea': txtConName.text,
              'descTarea': txtConDsc.text,
              'estadoTarea': dropDownValue!.substring(0, 1)
            }).then((value) {
              var msj =
                  (value > 0) ? 'La inserción fue exitosa' : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          } else {
            agendaDB!.UPDATE('tblTareas', {
              'idTarea': widget.tareaModel!.idTarea,
              'nombreTarea': txtConName.text,
              'descTarea': txtConDsc.text,
              'estadoTarea': dropDownValue!.substring(0, 1)
            }).then((value) {
              GlobalValues.flagTask.value = !GlobalValues.flagTask.value;
              var msj = (value > 0)
                  ? 'La actualización fue exitosa'
                  : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          }
        },
        child: const Text('Guardar Tarea'));

    return Scaffold(
      appBar: AppBar(
        title: widget.tareaModel == null
            ? const Text('Agregar tarea')
            : const Text('Actualizar tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            txtNameTask,
            space,
            txtDscTask,
            space,
            ddBStatus,
            space,
            btnGuardar
          ],
        ),
      ),
    );
  }
}
