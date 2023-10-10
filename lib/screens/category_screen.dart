import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shop/data/product_data.dart';

import '../tiles/product_tile.dart';

class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  const CategoryScreen(this.snapshot);

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Text(
                data['title'],
              style: const TextStyle(
                  fontFamily: 'NikeFont',
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Color(0xfff5f5f5)
              )),
              bottom: const TabBar(
                indicatorColor: Color(0xfff5f5f5),
                tabs: [
                  Tab(icon: Icon(Icons.grid_on, color: Color(0xfff5f5f5))),
                  Tab(icon: Icon(Icons.list, color: Color(0xfff5f5f5)))
                ],
              ),
          ),
          body: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("products")
              .doc(snapshot.id).collection("items").snapshots(),
              //FirebaseFirestore.instance.collection("products")
              //     .where(FieldPath.documentId, isEqualTo: snapshot.id)
              //     .snapshots(),
              builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator()
                );
              }
              else {
                //Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
                return TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GridView.builder(
                        padding: const EdgeInsets.all(4),
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            childAspectRatio: 0.6
                          ),
                          itemBuilder: (context, index) {
                          return ProductTile("grid",
                              ProductData.fromDocument(snapshot.data!.docs[index])
                          );
                        }
                      ),
                      ListView.builder(
                        padding: const EdgeInsets.all(4),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return ProductTile("list",
                              ProductData.fromDocument(snapshot.data!.docs[index])
                          );
                        },
                      )
                    ]
                );
              }
            }
          ),
        )
    );
  }

}

