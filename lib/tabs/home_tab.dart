import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Colors.deepOrange, Colors.orangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        );

    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              floating: true,
              snap: true,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Image.asset("assets/images/nikeswoosh.png",
                      color: const Color(0xfff5f5f5)),
              )// Text("Novidades",
                  //     style: TextStyle(
                  //         fontFamily: 'NikeFont',
                  //         fontSize: 24,
                  //         fontWeight: FontWeight.w500,
                  //         color: Color(0xfff5f5f5))))
            ),
            FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection("home")
                    .orderBy("pos")
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return SliverToBoxAdapter(
                        child: Container(
                      height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ));
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                      child: Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: Text("Erro: ${snapshot.error}"),
                      ),
                    );
                  } else {
                    return SliverGrid.builder(
                      itemCount: snapshot.data!.docs.length,
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(2, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 2),
                        ],
                      ),
                      itemBuilder: (context, index) {
                        final doc = snapshot.data!.docs[index];
                        return GridTile(
                            child: SizedBox(
                          width: doc['x'].toDouble(),
                          height: doc['y'].toDouble(),
                          child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: doc['image'],
                              fit: BoxFit.cover),
                        ));
                      },
                    );
                  }
                })
          ],
        )
      ],
    );
  }
}
