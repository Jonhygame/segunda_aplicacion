import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/database/agendadb.dart';
import 'package:segunda_aplicacion/network/api_weather.dart';
import 'package:segunda_aplicacion/screens/locationDetailScreen.dart';
import 'package:segunda_aplicacion/screens/maps_screen.dart';
import 'package:segunda_aplicacion/screens/weather_screen.dart';

class listWeatherMarks extends StatefulWidget {
  const listWeatherMarks({super.key});

  @override
  State<listWeatherMarks> createState() => _listWeatherMarksState();
}

class _listWeatherMarksState extends State<listWeatherMarks> {
  late Future<List<Map<String, dynamic>>> locations;

  @override
  void initState() {
    super.initState();
    locations = _getLocations();
  }

  Future<List<Map<String, dynamic>>> _getLocations() async {
    List<Map<String, dynamic>> locationList =
        await AgendaDB().getAllLocations();

    if (locationList != null) {
      List<Map<String, dynamic>> updatedList = [];

      WeatherLogic weatherLogic = WeatherLogic();

      for (var location in locationList) {
        double temperature = await weatherLogic.getTemperature(
            location['latitud'], location['longitud']);
        Map<String, dynamic> updatedLocation = {
          ...location,
          'temperature': temperature
        };
        updatedList.add(updatedLocation);
      }

      return updatedList;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: FutureBuilder(
        future: locations,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> locationList =
                snapshot.data as List<Map<String, dynamic>>;

            return ListView.builder(
              itemCount: locationList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    locationList[index]['nombre'],
                    style: const TextStyle(
                      color: Color.fromARGB(255, 211, 211, 211),
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    'Latitud: ${locationList[index]['latitud']}\nLongitud: ${locationList[index]['longitud']}\nTemperatura: ${locationList[index]['temperature']}°C',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 51, 51, 51),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'Open Sans',
                      fontSize: 15,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationDetailScreen(
                            latitude: locationList[index]['latitud'],
                            longitude: locationList[index]['longitud'],
                          ),
                        ));
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
