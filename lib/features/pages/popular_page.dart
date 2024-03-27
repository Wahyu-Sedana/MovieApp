import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../../src/providers/popular_provider.dart';
import '../../src/models/movie_models.dart';

class PopularPage extends StatelessWidget {
  const PopularPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PopularProvider>(
      builder: (context, movieProvider, child) {
        if (!movieProvider.isFetched) {
          if (movieProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            movieProvider.fetchPopular();
            return SizedBox.shrink();
          }
        } else {
          final List<Movie> movies = movieProvider.popular;
          return SizedBox(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                final Movie movie = movies[index];
                return Column(
                  children: [
                    AnimatedPadding(
                      padding: EdgeInsets.all(8.0),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 400),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      // Tambahkan Center di sini
                      child: Text(
                        movie.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        textAlign: TextAlign.center, // Atur textAlign menjadi center
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Atur mainAxisAlignment menjadi center
                      children: [
                        Column(
                          children: [
                            Text(
                              movie.popularity.toString(),
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 7),
                            Text('Popularity', style: TextStyle(color: Colors.white54))
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              movie.voteCount.toString(),
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 7),
                            Text('Vote Count', style: TextStyle(color: Colors.white54))
                          ],
                        ),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            Text(
                              movie.voteAverage.toString(),
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                            SizedBox(height: 7),
                            Text('Vote Average', style: TextStyle(color: Colors.white54))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    OutlinedButton(
                      onPressed: () {},
                      child: Container(
                        width: 250,
                        child: Text(
                          'Read More',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}
