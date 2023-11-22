//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:segunda_aplicacion/firebase/favorites_firebase.dart';
import 'package:segunda_aplicacion/widgets/CardMessageWidget.dart';

class PopularFirebaseScreeen extends StatefulWidget {
  const PopularFirebaseScreeen({super.key});

  @override
  State<PopularFirebaseScreeen> createState() => _PopularFirebaseScreeenState();
}

class _PopularFirebaseScreeenState extends State<PopularFirebaseScreeen> {
  var asd = 0;
  FavoritesFirebase? _FavoritesFirebase;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _FavoritesFirebase = FavoritesFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _FavoritesFirebase!.getAllFavorites(),
          builder: (context, snapchot) {
            if (snapchot.hasData) {
              return ListView.builder(
                  itemCount: snapchot.data!.docs.length,
                  itemBuilder: (context, index) {
                    //return Text(snapchot.data!.docs[index].get('title'));
                    //MessageBubble(message: Text(snapchot.data!.docs[index].get('title')),isMe: true);
                    return Column(
                      children: [
                        MessageBubble(
                            message: snapchot.data!.docs[index].get('title'),
                            isMe: snapchot.data!.docs[index].get('user')),
                        /*snapchot.data!.docs[index].get('img') != null
                            ? Image.network(
                                snapchot.data!.docs[index].get('img'))
                            : const Text('img')*/
                      ],
                    );
                    /*if (snapchot.data!.docs[index].get('title') == 'Titanic') {
                      return Text(snapchot.data!.docs[index].get('title'));
                    } else {
                      if (asd == 0) {
                        asd = 1;
                        return const Text('otros');
                      } else {
                        return const Text('');
                      }
                    }*/
                  });
            } else {
              if (snapchot.hasError) {
                return const Center(child: Text('Error'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }
          }),
    );
  }
}
