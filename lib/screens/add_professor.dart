import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/carrera_model.dart';
import 'package:segunda_aplicacion/models/profesor_model.dart';

class AddProfe extends StatefulWidget {
  AddProfe({super.key, this.profeModel});

  ProfessorModel? profeModel;

  @override
  State<AddProfe> createState() => _AddProfeState();
}

class _AddProfeState extends State<AddProfe> {
  TextEditingController txtProfeName = TextEditingController();
  TextEditingController txtProfeemail = TextEditingController();
  int? selectedidCareer;
  List<CareerModel> carreras = [];

  AgendaDB? agendaDB;

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
    if (widget.profeModel != null) {
      txtProfeName.text = widget.profeModel!.nameProfessor!;
      txtProfeemail.text = widget.profeModel!.email!;
      selectedidCareer = widget.profeModel!.idCareer!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtNameProfe = TextFormField(
      decoration: const InputDecoration(
          label: Text('Profesor'), border: OutlineInputBorder()),
      controller: txtProfeName,
    );
    final txtEmailProfe = TextFormField(
      decoration: const InputDecoration(
          label: Text('Email'), border: OutlineInputBorder()),
      controller: txtProfeemail,
    );

    final space = SizedBox(
      height: 10,
    );

    final ElevatedButton btnGuardar = ElevatedButton(
        onPressed: () {
          if (widget.profeModel == null) {
            agendaDB!.INSERT('tblProfesor', {
              'nameProfessor': txtProfeName.text,
              'email': txtProfeemail.text,
              'idCareer': selectedidCareer,
            }).then((value) {
              var msj =
                  (value > 0) ? 'La inserción fue exitosa' : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          } else {
            agendaDB!
                .UPDATE4(
                    'tblProfesor',
                    {
                      'idProfessorssor': widget.profeModel!.idProfessor,
                      'nameProfessor': txtProfeName.text,
                      'email': txtProfeemail.text,
                      'idCareer': selectedidCareer,
                    },
                    'idProfessorssor',
                    widget.profeModel!.idProfessor!)
                .then((value) {
              GlobalValues.flagPR4Profe.value =
                  !GlobalValues.flagPR4Profe.value;
              var msj = (value > 0)
                  ? 'La actualización fue exitosa'
                  : 'Ocurrió un error';
              var snackbar = SnackBar(content: Text(msj));
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
              Navigator.pop(context);
            });
          }
        },
        child: Text('Guardar profesor'));

    return Scaffold(
      appBar: AppBar(
        title: widget.profeModel == null
            ? Text('Agregar profesor')
            : Text('Actualizar profesor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            txtNameProfe,
            space,
            txtEmailProfe,
            space,
            FutureBuilder<List<CareerModel>>(
              future: agendaDB!.GETALLCARRERAS(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    carreras = snapshot.data!;
                    return DropdownButtonFormField<int>(
                      value: selectedidCareer,
                      items: carreras.map((carrera) {
                        return DropdownMenuItem<int>(
                          value: carrera.idCareer,
                          child: Text(carrera.nameCareer!),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedidCareer = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Carrera',
                      ),
                    );
                  } else {
                    return const Text('No se encontraron carreras');
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            space,
            btnGuardar
          ],
        ),
      ),
    );
  }
}
