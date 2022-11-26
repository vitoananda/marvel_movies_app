class MoviesModel {
  List<Movies>? movies;

  MoviesModel({
    this.movies,
  });

  MoviesModel.fromJson(Map<String, dynamic> json){
    if (json['data'] != null) {
      movies = <Movies>[];
      json['data'].forEach((v) {
        movies!.add(new Movies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movies != null) {
      data['movies'] = this.movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Movies {
  int? id;
  String? title;
  String? release;
  int? duration;
  String? cover_url;
  String? overview;
  String? directed_by;
  String? release_date;
  int? number_episodes;

  Movies({
    this.id,
    this.title,
    this.release,
    this.duration,
    this.cover_url,
    this.overview,
    this.directed_by,
    this.release_date,
    this.number_episodes,
  });

  Movies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    release = json['release_date'];
    duration = json['duration'];
    cover_url = json['cover_url'];
    overview = json['overview'];
    directed_by = json['directed_by'];
    release_date = json['release_date'];
    number_episodes = json['number_episodes'];

  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['release'] = this.release;
    data['duration'] = this.duration;
    data['cover_url'] = this.cover_url;
    data['overview'] = this.overview;
    data['directed_by'] = this.directed_by;
    data['release_date'] = this.release_date;
    data['number_episodes'] = this.number_episodes;
    return data;
  }
}