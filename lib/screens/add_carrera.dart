import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/carrera_model.dart';

// ignore: must_be_immutable
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

    const space = SizedBox(
      height: 10,
    );

    final ElevatedButton btnGuardar = ElevatedButton(
        onPressed: () {
          if (widget.carreraModel == null) {
            if (txtCarreraName.text != '') {
              agendaDB!.INSERT('tblCarrera',
                  {'nameCareer': txtCarreraName.text}).then((value) {
                var msj = (value > 0)
                    ? 'La inserción fue exitosa'
                    : 'Ocurrió un error';
                var snackbar = SnackBar(content: Text(msj));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                Navigator.pop(context);
              });
            } else {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Awas'),
                      content: const Text('Llena todos los datos profis'),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Entendido')),
                      ],
                    );
                  });
            }
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
        child: const Text('Guardar carrera'));

    return Scaffold(
      appBar: AppBar(
        title: widget.carreraModel == null
            ? const Text('Agregar carrera')
            : const Text('Actualizar carrera'),
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
