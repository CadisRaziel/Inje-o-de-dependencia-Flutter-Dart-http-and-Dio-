import 'package:dio/dio.dart';

//! Segunda FORMA
//! Desse jeito ainda não esta desaclopado !!!

void main() async{
  //*Depois instancio o dio aqui 
final dio = Dio();

 final product = Product();

 //*E depois eu instancio o dio na classe products
 product.dio = dio;
 final list = await product.fetchProducts();
 print(list);
}

class Product {

  //? Primeiro Podemos fazer via get e set
  var dio = Dio();

  Future<List> fetchProducts() async {     
    final response = await Dio().get('https://jsonplaceholder.typicode.com/todos/');
    return response.data;
  }
}

  