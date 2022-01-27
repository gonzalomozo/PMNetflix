
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pnetflix/componentes/homepeliculas/helpers/debouncer.dart';
import 'package:pnetflix/componentes/homepeliculas/models/models.dart';
import 'package:pnetflix/componentes/homepeliculas/models/proximasmovies_response.dart';

import 'dart:convert';

import 'package:pnetflix/componentes/homepeliculas/models/search_response.dart';


class MoviesProvider extends ChangeNotifier{
  String _apiKey = '10f24e35c7ef8d543ab6467d555b0f5b';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';

List<Movie> onDisplayMovies =[];
List<Movie> popularMovies =[];
Map<int, List<Cast>> moviesCast ={};
List<Movie> uncomingMovies =[];

int _popularPage = 0;

final debouncer = Debouncer(duration: Duration(milliseconds: 500),

);

final StreamController<List<Movie>> _suggeestionStreamController = new StreamController.broadcast();
Stream<List<Movie>> get suggestionStream => this._suggeestionStreamController.stream;

MoviesProvider(){
  print('MoviesProvider inicializado');

  this.getOnDisplayMovies();
  this.getPopularMovies();
  this.getUncomingMovies();
}

Future<String>_getJsonData(String endpoint,[int page = 1]) async{

final url =
      Uri.https( _baseUrl, endpoint, {
        'api_key': _apiKey,
        'language':_language,
        'page':'$page',
      });

  // Await the http get response, then decode the json-formatted response.
  final  response = await http.get(url);
  return response.body; 

}

getOnDisplayMovies() async{

  final jsonData = await this._getJsonData('3/movie/now_playing');
  final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);
  
  onDisplayMovies = nowPlayingResponse.results;
  notifyListeners();
}



getPopularMovies()async{
 
   _popularPage++;

  final jsonData = await this._getJsonData('3/movie/now_playing', _popularPage);
  final popularResponse = PopularResponse.fromJson(jsonData);
  
  popularMovies = [...popularMovies, ...popularResponse.results];

  notifyListeners();
}

getUncomingMovies()async{
 
   _popularPage++;

  final jsonData = await this._getJsonData('3/movie/upcoming', _popularPage);
  final proximasMoviesResponse = ProximasMoviesResponse.fromJson(jsonData);
  
  uncomingMovies = [...uncomingMovies, ...proximasMoviesResponse.results];

  notifyListeners();
}

Future<List<Cast>> getMovieCast(int movieId)async{

  if(moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
//revisar el mapa
print('pidiendo info al servidor cast');

final jsonData = await this._getJsonData('3/movie/$movieId/credits');
final creditsResponse = CreditsResponse.fromJson(jsonData);
moviesCast[movieId] = creditsResponse.cast;
return creditsResponse.cast;

}
Future<List<Movie>> searchMovies(String query) async{
final url =
      Uri.https( _baseUrl,'3/search/movie', {
        'api_key': _apiKey,
        'language':_language,
        'query': query,
      });
  final  response = await http.get(url);
  final  searchResponse = SearchResponse.fromJson( response.body);
  return searchResponse.results;
}

void getSuggestionsByQuery(String searchTerm){

debouncer.value = '';
debouncer.onValue = ( value ) async{
 // print('tenemos valor a buscar: $value');
 final results = await this.searchMovies(value);
 this._suggeestionStreamController.add(results);
};
  final timer = Timer.periodic(Duration(milliseconds: 300), ( _ ) { 
  debouncer.value = searchTerm;
  }); 
  Future.delayed(Duration(milliseconds: 301)).then(( _ ) => timer.cancel());

}
}