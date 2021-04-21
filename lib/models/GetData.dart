import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:movie/repos/Movie.dart';

const String url = 'https://api.themoviedb.org/3/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc&api_key=c13266a43d32560b8ada0c8b33bc0311';

Future<Movie> getData() async{
  http.Response response = await http.Client().get(url);
  if(response.statusCode == 200){
    return compute(movieFromMap, response.body);
  }
  else{
    throw Exception('Error Data');
  }
}