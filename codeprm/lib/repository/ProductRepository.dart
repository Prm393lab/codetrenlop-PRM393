import 'package:codeprm/models/Product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

class ProductRepository {
  ProductRepository();
  var products = Product.getList();

  Future<List<Product>> getAll() async {
    // Code doc du lieu mockdata
    return products;
  }

  Future<void> addProduct(Product p) async {
    // Code them du lieu mockdata
    products.add(p);
  }

  Future<void> editProduct(Product p) async {
    // Code sua du lieu mockdata
    int index = products.indexWhere((e) => e.id == p.id);
    if (index != -1) {
      products[index] = p;
    }
  }

  Future<void> deleteProduct(Product p) async {
    // Code xoa du lieu mockdata
    int index = products.indexWhere((e) => e.id == p.id);
    if (index != -1) {
      products.removeAt(index);
    }
  }
}
