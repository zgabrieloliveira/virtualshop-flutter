import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shop/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return ListTile(
      title: Text(data['title'],
      style: const TextStyle(color: Colors.deepOrange)),
      trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.deepOrange),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(snapshot)));
        },
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 25,
        backgroundImage: NetworkImage(data['icon'])
      ),
    );
  }
}

