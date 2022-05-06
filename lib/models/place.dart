// Model class for the data each place must have
import 'dart:io';

import '../models/location.dart';

class Place {
  final String id, title;
  final Location location;
  final File image;
  Place({required this.id, required this.title, required this.image, required this.location});
}
