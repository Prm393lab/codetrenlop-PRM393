import 'package:flutter/material.dart';
import 'package:codeprm/models/Product.dart';
import 'package:codeprm/pages/About.dart';

class ProductListPage1 extends StatelessWidget {
  ProductListPage1({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu),
        title: Center(child: Text("ProductListPage1")),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            icon: Icon(
              Icons.account_circle,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: "NEXT",
          ),
        ],
      ),
      body: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  List<Product> products = [
    Product(
      id: "1",
      name: "Product 1",
      price: 100,
      description: "Description 1",
      imageUrl: "assets/images/images.jpg",
    ),
    Product(
      id: "2",
      name: "Product 2",
      price: 200,
      description: "Description 2",
      imageUrl: "assets/images/vuoi.png",
    ),
    Product(
      id: "3",
      name: "Product 3",
      price: 300,
      description: "Description 3",
      imageUrl: "assets/images/images.jpg",
    ),
    Product(
      id: "4",
      name: "Product 4",
      price: 400,
      description: "Description 4",
      imageUrl: "assets/images/vuoi.png",
    ),
  ];

  ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ListView(
    //   children: [
    //     for (int i = 0; i < products.length; i++)
    //       ProductCart(product: products[i]),
    //   ],
    // );
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => ProductCart(product: products[index]),
    );
  }
}

class ProductCart extends StatefulWidget {
  Product product;

  ProductCart({super.key, required this.product});

  @override
  State<StatefulWidget> createState() => _ProductCartState(product: product);
}

class _ProductCartState extends State<ProductCart> {
  Product product;

  _ProductCartState({required this.product});

  changeState() {
    setState(() {
      product.isFavorite = !product.isFavorite;
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
              child: Image.asset(product.imageUrl, width: 100, height: 500),
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
                            text: product.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text("ID: ${product.id}"),
                    Text("Name: ${product.name}"),
                    Text("Price: ${product.price}"),
                    Text(
                      "Description: ${product.description}",
                      textAlign: TextAlign.justify,
                    ),
                    Text("Is Favorite: ${product.isFavorite}"),
                    IconButton(
                      onPressed: changeState,
                      icon: Icon(
                        Icons.phone,
                        color: product.isFavorite ? Colors.red : Colors.grey,
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
