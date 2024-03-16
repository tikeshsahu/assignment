

import 'package:assignment/models/animals.dart';
import 'package:flutter/material.dart';

class AppUtils {

  static const String baseUri = "https://jsonplaceholder.typicode.com";

  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;

  static const double normalPadding = 16.0;
  static const double normalRadius = 12.0;

  static InputBorder inputOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(normalRadius),
      borderSide: const BorderSide(
      ),
    );
  }

  static InputBorder errorOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(normalRadius),
      borderSide: const BorderSide(
      ),
    );
  }

  static InputDecoration textFieldDecoration({String? hintText, String? labelText, String? errorText, bool error = false}) {
    return InputDecoration(
      labelText: labelText,
      errorText: errorText,
      hintText: hintText,
      border: inputOutlineBorder(),
      disabledBorder: inputOutlineBorder(),
      enabledBorder: inputOutlineBorder(),
      errorBorder: errorOutlineBorder(),
      focusedBorder: inputOutlineBorder(),
      focusedErrorBorder: errorOutlineBorder(),
      contentPadding: const EdgeInsets.only(left: normalPadding, right: normalPadding, top: 0, bottom: 0),
      alignLabelWithHint: false,
      // isDense: true,
    );
  }

  static List<Animals> animalsData = [
  Animals(name: "Dog", description: "The dog is a domesticated carnivore of the family Canidae.", image: "assets/images/dog.jpg"),
  Animals(name: "Cat", description: "The cat is a domestic species of small carnivorous mammal.", image: "assets/images/cat.jpg"),
  Animals(name: "Sparrow", description: "The house sparrow is a bird of the sparrow family Passeridae.", image: "assets/images/sparrow.jpg"),
  Animals(name: "Pigeon", description: "Pigeons and doves constitute the animal family Columbidae.", image: "assets/images/pigeon.jpg"),
  Animals(name: "Octopus", description: "The octopus is a soft-bodied, eight-limbed mollusc of the order Octopoda.", image: "assets/images/octopus.jpg"),
  Animals(name: "Rhino", description: "The rhinoceros, commonly abbreviated to rhino, is a member of any of the five extant species of odd-toed ungulates in the family Rhinocerotidae.", image: "assets/images/rhino.jpg"),
  Animals(name: "Leopard", description: "The leopard is one of the five extant species in the genus Panthera, a member of the Felidae.", image: "assets/images/leopard.jpg"),
  Animals(name: "Lion", description: "The lion is a species in the family Felidae; it is a muscular, deep-chested cat with a short, rounded head, a reduced neck and round ears, and a hairy tuft at the end of its tail.", image: "assets/images/lion.jpg"),
  Animals(name: "Jaguar", description: "The jaguar is a large felid species and the only extant member of the genus Panthera native to the Americas.", image: "assets/images/jaguar.jpg"),
];
}
