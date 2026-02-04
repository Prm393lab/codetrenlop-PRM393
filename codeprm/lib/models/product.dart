class Product {
  final String id;
  final String name;
  final int price;
  final String des;
  final String image;
  bool isFavorite;

  Product({
    this.price = 0,
    required this.id,
    required this.name,
    this.des = "",
    this.image = "",
    this.isFavorite = false,
  });
}
