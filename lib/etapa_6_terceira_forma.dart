import 'package:dio/dio.dart';

//! Terceira FORMA
//! Desse jeito ainda não esta desaclopado !!!

void main() async{
//*Aqui eu instancio o dio novamente
final dio = Dio();

//*e no final eu passo o dio instanciado aqui como parametro 
 final product = Product(dio);
 final list = await product.fetchProducts();
 print(list);
}

class Product {
  //*Primeiro passamos o dio para o construtor
 final Dio dio;

 //? lembre-se de tirar o construtor como nomeado !!
  Product(
    this.dio,
  );

  Future<List> fetchProducts() async {     
    final response = await Dio().get('https://jsonplaceholder.typicode.com/todos/');
    return response.data;
  }
}

  