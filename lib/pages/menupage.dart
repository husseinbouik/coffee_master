import 'package:coffee_master/datamanager.dart';
import 'package:flutter/material.dart';
import '../datamodel.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var p = Product(id: 1, name: "Dummy Product", price: 1.25, image: "");
    var q = Product(id: 2, name: "Dummy Product Much larger", price: 1.25, image: "");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Master'),
      ),
      body: Column(
        children: [
          ProductItem(product: p, onAdd: () {}),
          ProductItem(product: q, onAdd: () {}),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({Key? key, required this.product, required this.onAdd})
      : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4), // Reduced padding
      child: Card(
        elevation: 4,
        child: SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: Image.asset("images/black_coffee.png"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0), // Reduced padding
                        child: Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0), // Reduced padding
                        child: Text("\$${product.price}"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0), // Reduced padding
                    child: ElevatedButton(
                      onPressed: () {
                        onAdd(product);
                      },
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}