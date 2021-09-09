import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

//! Utilizando injeção de dependencia com interface

void main() async {
  //================================= Utilizando o Dio ==============================================
  final dio = Dio();
  final dioService = DioService(dio);
  //=================================================================================================


  //================================= Utilizando o Http ============================================== 
  final client = http.Client();
  final httpService = HttpService(client);
  //=================================================================================================

  //? Agora eu posso ficar invertendo entre o 'dioService' e o 'httpService' aqui no parametro de 'Product'
  final product = Product(dioService);
  // final product = Product(httpService);
  final list = await product.fetchProducts();
  print(list);
}

//======================== Interface para podermos usar o http e dio ================================
abstract class IhttpServiceAndDioService {
  //? Aqui será somente essa assinatura
  Future<dynamic> get(String url);
}
//====================================================================================================


//=============================== Utilizando o Dio ===================================================
class DioService extends IhttpServiceAndDioService {
  final Dio dio;
  DioService(
    this.dio,
  );

  //*Metodo da interface
  @override
  Future get(String url) async => (await dio.get(url)).data;
}
//=====================================================================================================


//=============================== Utilizando o Http ===================================================
class HttpService extends IhttpServiceAndDioService {
  final http.Client client;
  HttpService(
    this.client,
  );

  //*Metodo da interface
  @override
  Future get(String url) async => jsonDecode((await client.get(Uri.parse(url))).body);
}
//======================================================================================================

class Product {
  final IhttpServiceAndDioService service;

  Product(
    this.service,
  );

  Future<List> fetchProducts() async {
    final response =
        await service.get('https://jsonplaceholder.typicode.com/todos/');
    return response;
  }
}


//*Porque usar dessa forma ?
//*Imagine que um dia o dio quebre por conta de versão, ou o http
//*A unica coisa que precisariamos fazer para alterar, é o parametro de 'Product' la em cima
//*Porém temos que fazer dessa forma utilizando 2 packages 