import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/pelicula_model.dart';


class PeliculasProvider{

  

  String _apikey   = '1865f43a0549ca50d341dd9ab8b29f49';
  String _url      = 'api.themoviedb.org';
  String _language = 'es-ES';
 
  Future<List<Pelicula>> _procesaRespuesta(Uri uri) async {

    final resp = await http.get(uri);
    final decodedData = jsonDecode(resp.body);// transforma la respuesta en un mapa
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);// barre cada uno de los resultados que esten en esta lista y genera las peliculas en el formato correcto  

    //print(peliculas.items[0].title);

    return peliculas.items;


  }
  
  Future<List<Pelicula>> getEnCines() async {

    final url = Uri.https(_url, '3/movie/now_playing',{
 
      'api_key'  : _apikey,
      'language' : _language
    } );

    return await _procesaRespuesta(url);


  }

  Future<List<Pelicula>>  getPopulares() async{


    final url = Uri.https(_url, '3/movie/popular',{
 
      'api_key'  : _apikey,
      'language' : _language
    } );
    
    return await _procesaRespuesta(url);

    
    


  }

}