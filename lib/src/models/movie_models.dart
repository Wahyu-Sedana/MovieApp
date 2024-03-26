class Movie {
  final int id;
  final String title;
  final String posterPath;
  final double popularity;
  final int voteCount;
  final double voteAverage;

  Movie(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.popularity,
      required this.voteCount,
      required this.voteAverage});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        id: json['id'],
        title: json['title'],
        posterPath: json['poster_path'],
        popularity: json['popularity'],
        voteAverage: json['vote_average'],
        voteCount: json['vote_count']);
  }
}
