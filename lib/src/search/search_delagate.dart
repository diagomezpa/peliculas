
import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

 class DataSearch extends SearchDelegate{

   String seleccion = '';
  final peliculasProvider = new PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
    'Superman',
    'Ironman 2',
    'Ironman 3',
    'Ironman 4',
    'Ironman 5',
  ];

  final peliculasRecientes = [
    'Spiderman',
    'Capitan America'
  ];
  
  @override
  List<Widget> buildActions(BuildContext context) {
      // TODO: implement buildActions
      // acciones del app bar 

      return [

        IconButton(
                  icon: Icon(Icons.clear), 
                  onPressed:(){

                    print('CliCk');
                    query= '';
                  },
                  )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // TODO: implement buildLeading
      // Icono a la izquierda del app bar 
      return IconButton(
                      icon: AnimatedIcon(
                        icon:AnimatedIcons.menu_arrow,
                        progress: transitionAnimation
                      ), 
                      onPressed:(){

                       // print('Leading Icons page');

                       close(context, null);
                      }
                      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // TODO: implement buildResults
      // implementa los resultados que va a mostrar
      return Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: Colors.indigoAccent,
          child: Text(seleccion),

        ),

      );
    }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    if(query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query) ,
      
      builder: (BuildContext context, AsyncSnapshot <List <Pelicula>> snapshot) {
        if (snapshot.hasData){
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula) {
              return ListTile(

                leading: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain
                ),
                title: Text(pelicula.title),
                subtitle: Text(pelicula.originalTitle),
                onTap: (){
                  close(context,null);
                  pelicula.uniqueId='';
                  //Navigator.pushNamed(context, 'detalle',arguments: pelicula);
                  Navigator.pushNamed(context, 'datalle',arguments: pelicula);

                },
              );


            }).toList()
          );

        }else {

          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
  
/*     @override
    Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // sugerencias cuando las persona escribe

    final listaSugerida = ( query.isEmpty ) 
                           ? peliculasRecientes
                           : peliculas.where( 
                              (p)=> p.toLowerCase().startsWith(query.toLowerCase()) 
                          ).toList();
    return ListView.builder(
          itemCount: listaSugerida.length,
          itemBuilder:(context , i ){
            return ListTile(
              leading: Icon(Icons.movie),
              title: Text(listaSugerida[i]),
              onTap: (){
                seleccion=listaSugerida[i];
                showResults(context);
              },
            );
          }
          
          );
  }
 */

 }