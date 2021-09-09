
import 'package:dio/dio.dart';

void main() async{
 final product = Product();
 final list = await product.fetchProducts();
 print(list);
}

//*O Dio da forma que esta implementado aqui é uma dependencia que esta 100% aclopada a classe
class Product {
  Future<List> fetchProducts() async {     
    final response = await Dio().get('https://jsonplaceholder.typicode.com/todos/');
    return response.data;
  }
}
