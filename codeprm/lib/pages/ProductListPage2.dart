import 'package:codeprm/services/GlobalStateService.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:codeprm/repository/ProductRepository.dart';
import 'package:codeprm/models/Product.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repo = ref.watch(productRepositoryProvider);
  return repo.getAll();
});

class ProductListPage2 extends ConsumerWidget {
  const ProductListPage2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var logState = ref.watch(loginsState);
    final products = ref.watch(productsProvider).value;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("ProductListPage2")),
        leading: Icon(Icons.menu),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(loginsState.notifier).state = !logState;
            },
            child: Text(logState ? "Logout" : "Login"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products!.length,
        itemBuilder: (context, index) => ProductCart(product: products[index]),
      ),
    );
  }
}

class ProductCart extends StatefulWidget {
  final Product product;

  ProductCart({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  changeState() {
    setState(() {
      widget.product.isFavorite = !widget.product.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 210,
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                widget.product.imageUrl,
                width: 100,
                height: 500,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Name: ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        children: [
                          TextSpan(
                            text: widget.product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("ID: ${widget.product.id}"),
                    Text("Name: ${widget.product.name}"),
                    Text("Price: ${widget.product.price}"),
                    Text(
                      "Description: ${widget.product.description}",
                      textAlign: TextAlign.justify,
                    ),
                    Text("Is Favorite: ${widget.product.isFavorite}"),
                    IconButton(
                      onPressed: changeState,
                      icon: Icon(
                        Icons.phone,
                        color: widget.product.isFavorite
                            ? Colors.red
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
