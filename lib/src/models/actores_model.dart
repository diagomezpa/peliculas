// Generated by https://quicktype.io

class Cast {

  List <Actor> actores = new List();

  Cast.fromJsonList(List<dynamic> jsonList){

    if(jsonList == null ) return ;

    jsonList.forEach((item) { 

      final actor = Actor.fromJsonMap(item);
      actores.add(actor);
    });

  }

}


class Actor {
  bool adult;
  int gender;
  int id;

  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  String job;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.job,
  });


  Actor.fromJsonMap(Map <String,dynamic> json){

    castId      = json['cast_id'];
    character   = json['character'];
    creditId    = json['credit_id'];
    gender      = json['gender'];
    id          = json['id'];
    name        = json['name'];
    order       = json['order'];
    profilePath = json['profile_path'];
    

  }

  getFoto() {

    if ( profilePath == null ) {
      return 'https://png.pngtree.com/png-vector/20191110/ourlarge/pngtree-avatar-icon-profile-icon-member-login-vector-isolated-png-image_1978396.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }

  }
}

