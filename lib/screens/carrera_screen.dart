import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/assets/global_values.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/carrera_model.dart';
import 'package:segunda_aplicacion/widgets/CardCarreraWidget.dart';

class CarreraScreen extends StatefulWidget {
  const CarreraScreen({super.key});

  @override
  State<CarreraScreen> createState() => _CarreraPR4ScreenState();
}

class _CarreraPR4ScreenState extends State<CarreraScreen> {
  AgendaDB? agendaDB;
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin de Carreras'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, '/addCarrera').then((value) {
              setState(() {});
            }),
            icon: const Icon(Icons.hdr_plus_outlined),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchTerm = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Buscar carrera...',
              ),
            ),
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: GlobalValues.flagPR4Carrera,
        builder: (context, value, _) {
          return FutureBuilder(
            future: agendaDB!.searchCarreras(searchTerm),
            builder: (BuildContext context,
                AsyncSnapshot<List<CareerModel>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardCarreraWidget(
                      carreraModel: snapshot.data![index],
                      agendaDB: agendaDB,
                    );
                  },
                );
              } else {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Error!'),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }
            },
          );
        },
      ),
    );
  }
}
