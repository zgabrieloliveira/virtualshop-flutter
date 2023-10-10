import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  late String category;
  late String id;
  late String title;
  late double price;
  late List pics;
  late List sizes;

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    id = snapshot.id;
    title = data['title'];
    price = data['price'];
    pics = data['pics'];
    sizes = data['sizes'];
  }

}