import 'package:dio/dio.dart';

//! Primeira FORMA
//! Desse jeito ainda não esta desaclopado !!!

//? Aqui temos um pouco menos de aclopamento
void main() async{
 final product = Product();

//*Aqui eu instancio o dio
final dio = Dio();

//*e passo o dio aqui como parametro
 final list = await product.fetchProducts(dio);
 print(list);
}

class Product {
  //*1º forma de utilizar a injeção de dependencia, passando o dio como parametro
  Future<List> fetchProducts(Dio dio) async {     
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos/');
    return response.data;
  }
}

  