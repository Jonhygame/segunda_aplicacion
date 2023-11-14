import 'package:flutter/widgets.dart';

Widget itemMovieWidget(String? posterURL) {
  if (posterURL != null) {
    return FadeInImage(
        fit: BoxFit.fill,
        fadeInDuration: const Duration(milliseconds: 500),
        placeholder: const AssetImage('assets/loading2.gif'),
        image: NetworkImage('https://image.tmdb.org/t/p/w500/$posterURL'));
  } else {
    return const Text('Imagen no disponible');
  }
}
