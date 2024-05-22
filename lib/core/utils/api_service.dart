import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');

    print(response.data);

    return response.data;
  }
}



// // print data 
// import 'package:dio/dio.dart';

// void main() {
//   fetchData();
// }

// Future<void> fetchData() async {
//   try {
//     var response = await Dio()
//         .get('https://www.googleapis.com/books/v1/volumes?q=programming');
//     print(response.data);
//   } catch (e) {
//     print(e);
//   }
// }
