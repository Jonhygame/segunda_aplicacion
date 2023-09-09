import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:segunda_aplicacion/screens/card_screen.dart';

class ItemScreen extends StatelessWidget {
  ItemScreen({super.key});

  final data = [
    ItemCardData(
        title: "Txt card 1",
        subtitle: "Information User",
        image: const AssetImage('assets/images/avatar.png'),
        backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
        titleColor: Colors.pink,
        subtitleColor: Colors.white,
        background: LottieBuilder.asset('assets/animation/bg_4.json')),
    ItemCardData(
        title: "Txt card 2",
        subtitle: "Info",
        image: const AssetImage('assets/images/avatar.png'),
        backgroundColor: Colors.white,
        titleColor: Colors.blueAccent,
        subtitleColor: Colors.black,
        background: LottieBuilder.asset('assets/animation/bg_4.json')),
    ItemCardData(
        title: "Txt card 3",
        subtitle: "Info",
        image: const AssetImage('assets/images/avatar.png'),
        backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
        titleColor: Colors.yellow,
        subtitleColor: Colors.white,
        background: LottieBuilder.asset('assets/animation/bg_4.json'))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return ItemCard(data: data[index]);
        },
      ),
    );
  }
}
