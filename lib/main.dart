import 'package:dio/dio.dart';

void main() async{
 final product = Product();
 final list = await product.fetchProducts();
 print(list);
}

class Product {
  Future<List> fetchProducts() async {     
    final response = await Dio().get('https://jsonplaceholder.typicode.com/todos/');
    return response.data;
  }
}

  