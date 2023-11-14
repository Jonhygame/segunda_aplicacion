import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/carrera_model.dart';
import 'package:segunda_aplicacion/screens/add_carrera.dart';

// ignore: must_be_immutable
class CardCarreraWidget extends StatelessWidget {
  CardCarreraWidget({super.key, required this.carreraModel, this.agendaDB});

  CareerModel carreraModel;
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
            children: [Text(carreraModel.nameCareer!)],
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
                            AddCarrera(carreraModel: carreraModel))),
                child: Image.asset('assets/icon_orange.png', height: 50),
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Mensaje del sistema'),
                          content: Text('¿Deseas borrar la carrera?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  agendaDB!
                                      .DELETE4('tblCarrera', 'idCareer',
                                          carreraModel.idCareer!)
                                      .then((value) {
                                    if (value == 0) {
                                      Navigator.pop(context);
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text('Alerta'),
                                              content: Text('Tiene asginada.'),
                                              actions: [
                                                TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text('Entendido')),
                                              ],
                                            );
                                          });
                                    } else {
                                      Navigator.pop(context);
                                      GlobalValues.flagPR4Carrera.value =
                                          !GlobalValues.flagPR4Carrera.value;
                                    }
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
