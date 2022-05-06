import 'package:flutter/material.dart';
import 'package:hotspots/providers/user_places.dart';
import 'package:hotspots/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

import './screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// stateless widget so no init method. if stateful, then TODO: initialise UserPlaces class in init state and use that created object in the ChangeNotifierProvider.value
  @override
  Widget build(BuildContext context) {
    // Change notifier provider widget to set up the provider we need for the app. Use value since
    return ChangeNotifierProvider(
      create: (BuildContext context) => UserPlaces(),
      child: MaterialApp(
        theme: ThemeData(textTheme: const TextTheme(), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo).copyWith(secondary: Colors.amber)),
        home: const PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName: (_) => const AddPlacesScreen(),
        },
      ),
    );
  }
}
