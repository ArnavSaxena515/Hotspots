import 'package:flutter/material.dart';

import '../widget/image_input.dart';

class AddPlacesScreen extends StatefulWidget {
  const AddPlacesScreen({Key? key}) : super(key: key);
  static const String routeName = "/add-place-screen";

  @override
  State<AddPlacesScreen> createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final GlobalKey<FormState> _addNewPlaceFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new place"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Form(
              key: _addNewPlaceFormKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Place name", label: Text("Title")),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter a title for this place";
                          }
                          return null;
                        },
                      ),
                      const ImageInput(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.secondary),
            ),
            // ElevatedButton.styleFrom(
            //   elevation: 0,
            //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            // ),
            icon: const Icon(Icons.add),
            onPressed: () {
              if (_addNewPlaceFormKey.currentState!.validate()) {
                _addNewPlaceFormKey.currentState!.save();
              }
              //todo submit logic here
            },
            label: const Text("Add Hotspot"),
          )
        ],
      ),
    );
  }
}
