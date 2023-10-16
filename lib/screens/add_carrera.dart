import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/carrera_model.dart';

class AddCarrera extends StatefulWidget {
  AddCarrera({super.key, this.carreraModel});

  CareerModel? carreraModel;

  @override
  State<AddCarrera> createState() => _AddCarreraState();
}

class _AddCarreraState extends State<AddCarrera> {
  TextEditingController txtCarreraName = TextEditingController();

  AgendaDB? agendaDB;

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
    if (widget.carreraModel != null) {
      txtCarreraName.text = widget.carreraModel!.nameCareer!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtNameCarrera = TextFormField(
      decoration: const InputDecoration(
          label: Text('Carrera'), border: OutlineInputBorder()),
      controller: txtCarreraName,
    );

    final space = SizedBox(
      height: 10,
    );

    final ElevatedButton btnGuardar = ElevatedButton(
        onPressed: () {
          if (widget.carreraModel == null) {
            agendaDB!
                .INSERT('tblCarrera', {'nameCareer': txtCarreraName.text}).then(
                    (value) {
              var msj =
                  (value > 0) ? 'La inserción fue exitosa' : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          } else {
            agendaDB!
                .UPDATE4(
                    'tblCarrera',
                    {
                      'idCareer': widget.carreraModel!.idCareer,
                      'nameCareer': txtCarreraName.text
                    },
                    'idCareer',
                    widget.carreraModel!.idCareer!)
                .then((value) {
              GlobalValues.flagPR4Carrera.value =
                  !GlobalValues.flagPR4Carrera.value;
              var msj = (value > 0)
                  ? 'La actualización fue exitosa'
                  : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          }
        },
        child: Text('Guardar carrera'));

    return Scaffold(
      appBar: AppBar(
        title: widget.carreraModel == null
            ? Text('Agregar carrera')
            : Text('Actualizar carrera'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [txtNameCarrera, space, btnGuardar],
        ),
      ),
    );
  }
}
