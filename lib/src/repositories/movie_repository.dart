import 'package:flutter/material.dart';
import 'package:movie_ui/src/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import '../models/movie_models.dart';

class MovieListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, movieProvider, child) {
        return FutureBuilder<List<Movie>>(
          future: movieProvider.fetchMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Movie> movies = snapshot.data!;
              return Center(
                child: SizedBox(
                  child: ScrollSnapList(
                    itemBuilder: (context, index) {
                      final movie = movies[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Container(
                              width: 300,
                              height: 450,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black87.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 10,
                                    offset: Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
                                  placeholder: (context, url) => CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                  width: 300,
                                  height: 450,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Text(
                              movie.title,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
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
                                SizedBox(width: 25),
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
                                SizedBox(width: 25),
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
                            SizedBox(height: 20),
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
                        ),
                      );
                    },
                    itemCount: movies.length,
                    itemSize: 300,
                    dynamicItemSize: true,
                    onItemFocus: (int index) {},
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
