import '../datamanager.dart';
import 'package:flutter/material.dart';
import '../datamodel.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return FutureBuilder(
      future: dataManager.getMenu(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data! as List<Category>;
          // return Text("There are ${categories.length} categories");
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: ((context,index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(categories[index].name),
                ),
              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
              itemCount: categories[index].products.length,
              itemBuilder:(context,prodIndex){
                var product = categories[index].products[prodIndex];
                return ProductItem(
                  product: product, 
                  onAdd: (addedProduct){
                  dataManager.cartAdd(addedProduct);
                });
              } ,
              )
              ],
            );
          }));
        } else {
  if (snapshot.hasError) {
      return const Text("there was an error");
    } else {
      
      return const CircularProgressIndicator();
    }
        }
    }),
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
                child: Image.network(product.imageUrl),
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
                        child: Text("\$${product.price.toStringAsFixed(2)}"),
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