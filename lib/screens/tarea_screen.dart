import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/models/tarea_model.dart';
import 'package:segunda_aplicacion/widgets/CardTareaWidget.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  AgendaDB? agendaDB;

  @override
  void initState() {
    super.initState();
    agendaDB = AgendaDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addtarea').then((value) {
                  setState(() {});
                });
              },
              icon: const Icon(Icons.task))
        ],
      ),
      body: FutureBuilder(
          future: agendaDB!.GETALLTAREAS(),
          builder:
              (BuildContext context, AsyncSnapshot<List<TareaModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardTareaWidget(
                      tareaModel: snapshot.data![index],
                      agendaDB: agendaDB,
                    );
                  });
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error!'),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }
          }),
    );
  }
}
