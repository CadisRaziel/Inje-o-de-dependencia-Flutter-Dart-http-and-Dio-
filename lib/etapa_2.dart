
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
void main() async{
 final product = Product();
 final list = await product.fetchProducts();
 print(list);
}

//*A classe Product esta dependente da 'Dio' e se a dio morrer um dia, não vamos conseguir substituir de forma tão facil
class Product {
  Future<List> fetchProducts() async { 
    //*è impossivel testar esse código com o Dio() sendo instanciado dessa forma !!
    //? Caso eu tente trocar o Dio pelo Http vai ter breakchanges
    //! Precisaria trocar o http.get por http.uriParse
    final response = await http.get('https://jsonplaceholder.typicode.com/todos/');
    //!aqui teria que fazer um jsonparse
    return response.data;
  }
}