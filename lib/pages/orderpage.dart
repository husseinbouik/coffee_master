import 'package:flutter/material.dart';
import '../datamanager.dart';
import '../datamodel.dart';

class OrderPage extends StatefulWidget {
  final DataManager dataManager;
  const OrderPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    // Check if the cart is empty
    if (widget.dataManager.cart.isEmpty) {
      return const Center(child: Text("Your order is empty"));
    } else {
      // Display cart items
      return ListView.builder(
        itemCount: widget.dataManager.cart.length,  // Corrected itemCount
        itemBuilder: (context, index) {
          var item = widget.dataManager.cart[index];
          return OrderItem(
            item: item,
            onRemove: (product) {
              setState(() {
                widget.dataManager.cartRemove(product); // Update cart and UI
              });
            },
          );
        },
      );
    }
  }
}

class OrderItem extends StatelessWidget {
  final ItemInCart item;
  final Function(Product) onRemove; // Improved typing

  const OrderItem({Key? key, required this.item, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("${item.quantity}x"),
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                item.product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: () => onRemove(item.product), // Simplified callback
                icon: const Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
