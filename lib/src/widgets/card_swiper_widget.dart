import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  

  final List<Pelicula> peliculas;

  CardSwiper({
    @required this.peliculas
  });

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top:10.0),
      //width: _screenSize.width*0.7,
      //height: _screenSize.height*0.5,
      
      child: Swiper(
        
        layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width * 0.7,
          itemHeight: _screenSize.height * 0.5,
          //itemWidth:200.0,
       
          itemBuilder: (BuildContext context,int index){ 

            peliculas[index].uniqueId= '${peliculas[index].id}-tarjeta';
            return Hero(
              tag: peliculas[index].uniqueId,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child:GestureDetector(
                  onTap: (){

                   // print(' ID de mi pelicula ${ peliculas[index].title}');
                    Navigator.pushNamed(context, 'datalle',arguments: peliculas[index]);
                     },
                    child: FadeInImage(
                    image:NetworkImage(peliculas[index].getPosterImg() ),
                    placeholder : AssetImage('assets/img/no-image.jpg'),
                    fit:BoxFit.cover,
                  ),
                ),
              ),
            ); 
              
            
          },
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),
          //control: new SwiperControl(),
        ),
    );
  }
}