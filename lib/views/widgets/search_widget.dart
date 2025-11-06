import 'package:flutter/material.dart';

Widget searchBarCustom({
  required String hintText,
  required TextEditingController searchController,
  required Function(String) onSubmit,
}) {
  return TextField(
    controller: searchController,
    onSubmitted: onSubmit,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white, fontSize: 15),
      fillColor: Colors.transparent,
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
    ),
  );
}
