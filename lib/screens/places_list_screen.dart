// Screen to show all the places user has saved
import "package:flutter/material.dart";
import 'package:hotspots/constants.dart';
import 'package:hotspots/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(appName), actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
          },
        ),
      ]),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
