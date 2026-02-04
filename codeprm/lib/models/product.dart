class Product {
  final String id;
  final String name;
  final int price;
  final String description;
  final String imageUrl;
  bool isFavorite;
  Product({
    required this.id,
    required this.name,
    this.price = 0,
    this.description = '',
    this.imageUrl = '',
    this.isFavorite = true,
  });
  void copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    String? imageUrl,
    bool? isFavorite,
  }) => Product(
    id: id ?? this.id,
    name: name ?? this.name,
    price: price ?? this.price,
    description: description ?? this.description,
    imageUrl: imageUrl ?? this.imageUrl,
    isFavorite: isFavorite ?? this.isFavorite,
  );

  static List<Product> getList() {
    return [
      Product(
        id: '1',
        name: 'Laptop Dell XPS 13',
        price: 25000000,
        description: 'Laptop cao cấp với màn hình 13 inch, chip Intel Core i7',
        imageUrl:
            'https://www.laptopvip.vn/images/ab__webp/detailed/38/notebook-xps-13-9350-t-oled-sl-gallery-5-www.laptopvip.vn-1725438558.webp',
        isFavorite: false,
      ),
      Product(
        id: '2',
        name: 'iPhone 15 Pro Max',
        price: 35000000,
        description: 'Điện thoại flagship mới nhất của Apple',
        imageUrl:
            'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-pro-max_2__5_2_1_1.jpg',
        isFavorite: true,
      ),
      Product(
        id: '3',
        name: 'Samsung Galaxy S24',
        price: 22000000,
        description: 'Smartphone Android cao cấp với camera AI',
        imageUrl:
            'https://images.samsung.com/vn/smartphones/galaxy-s24/images/galaxy-s24-highlights-kv.jpg?imbypass=true',
        isFavorite: false,
      ),
      Product(
        id: '4',
        name: 'AirPods Pro 2',
        price: 6000000,
        description: 'Tai nghe không dây chống ồn chủ động',
        imageUrl:
            'https://cdn.tgdd.vn/Products/Images/54/315014/tai-nghe-bluetooth-airpods-pro-2nd-gen-usb-c-charge-apple-1-750x500.jpg',
        isFavorite: true,
      ),
      Product(
        id: '5',
        name: 'iPad Air M2',
        price: 18000000,
        description: 'Máy tính bảng với chip M2 mạnh mẽ',
        imageUrl:
            'https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/i/p/ipad-air-m3-11-inch-1.jpg',
        isFavorite: false,
      ),
    ];
  }
}
