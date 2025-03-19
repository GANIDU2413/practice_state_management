import 'package:begin_statemanagement/data/product_data.dart';
import 'package:begin_statemanagement/models/product_model.dart';
import 'package:begin_statemanagement/pages/cart_page.dart';
import 'package:begin_statemanagement/pages/favorite_page.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = ProductData().products;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Shop'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritePage(),
                ),
              );
            },
            heroTag: "favorite_btn",
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(),
                ),
              );
            },
            heroTag: "cart_btn",
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final Product product = products[index];
          return Card(
            child: ListTile(
              title: Row(
                children: [
                  Text(product.title),
                ],
              ),
              subtitle: Text('\$ ${product.price.toString()}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.add_shopping_cart)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
