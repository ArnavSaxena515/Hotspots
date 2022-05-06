// Provider to manage and provide the data where required

import 'package:flutter/foundation.dart';
import '../models/place.dart';

class UserPlaces extends ChangeNotifier {
  final List<Place> _places = [];

  List<Place> get places {
    // getter returns a copy of the list so that the original list cannot be changed from outside. If changed from outside, NotifyListeners cannot be triggered
    return [..._places];
  }
}
