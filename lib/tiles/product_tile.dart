import 'package:flutter/material.dart';
import '../data/product_data.dart';

class ProductTile extends StatelessWidget {

  final String type;
  final ProductData product;

  const ProductTile(this.type, this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: type == "grid" ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
                aspectRatio: 0.8,
                child: Image.network(product.pics[0], fit: BoxFit.cover),
            ),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Text(product.title,
                          style: const TextStyle(fontWeight: FontWeight.w500)
                      ),
                      Text("R\$ ${product.price.toStringAsFixed(2)}",
                      style: const TextStyle(
                          color: Colors.deepOrange,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                )
            ),
          ],
        )
            : Row(),
        ),
    );
  }
}
