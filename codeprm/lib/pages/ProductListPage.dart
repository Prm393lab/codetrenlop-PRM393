import 'package:flutter/material.dart';
import 'package:codeprm/models/Product.dart';

class ProductListPage1 extends StatelessWidget {
  ProductListPage1({super.key});
  List<Product> products = [
    Product(
      id: "1",
      name: "Product 1",
      price: 100,
      des: "Description 1",
      image: "assets/images/images.jpg",
    ),
    Product(
      id: "2",
      name: "Product 2",
      price: 200,
      des: "Description 2",
      image: "assets/images/vuoi.png",
    ),
    Product(
      id: "3",
      name: "Product 3",
      price: 300,
      des: "Description 3",
      image: "assets/images/images.jpg",
    ),
    Product(
      id: "4",
      name: "Product 4",
      price: 400,
      des: "Description 4",
      image: "assets/images/vuoi.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu),
        title: Center(child: Text("Product List")),
        actions: [
          // IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...products
                .map((product) => ProductCard(product: product))
                .toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.greenAccent,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigate_next),
            label: "NEXT",
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(12),
            ),
            child: Image.asset(
              widget.product.image,
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: widget.product.isFavorite
                              ? Colors.red
                              : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            widget.product.isFavorite =
                                !widget.product.isFavorite;
                          });
                        },
                      ),

                      IconButton(
                        icon: Icon(Icons.shopping_cart, color: Colors.blue),
                        onPressed: () {
                          // Thêm sản phẩm vào giỏ hàng
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Text(
                    widget.product.des,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 10),

                  // PRICE
                  Text(
                    "\$${widget.product.price}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
