
import 'package:dio/dio.dart';

void main() async{
 final product = Product();
 final list = await product.fetchProducts();
 print(list);
}

//*A classe Product esta dependente da 'Dio' e se a dio morrer um dia, não vamos conseguir substituir de forma tão facil
class Product {
  Future<List> fetchProducts() async { 
    //*è impossivel testar esse código com o Dio() sendo instanciado dessa forma !!
    final response = await Dio().get('https://jsonplaceholder.typicode.com/todos/');
    return response.data;
  }
}

  