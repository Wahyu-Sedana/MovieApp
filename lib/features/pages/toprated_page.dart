import 'package:flutter/material.dart';
import 'package:movie_ui/src/models/toprated_models.dart';
import 'package:movie_ui/src/providers/toprated_provider.dart';
import 'package:provider/provider.dart';
import '../../src/models/movie_models.dart';

class TopRatedPage extends StatelessWidget {
  const TopRatedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TopRatedProvider>(
      builder: (context, topRatedProvider, child) {
        if (!topRatedProvider.isFetched) {
          if (topRatedProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            topRatedProvider.fetchTop();
            return SizedBox.shrink();
          }
        } else {
          final List<TopRated> topRates = topRatedProvider.topRate;
          return SizedBox(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRates.length,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                final TopRated topRate = topRates[index];
                return Column(
                  children: [
                    AnimatedPadding(
                      padding: EdgeInsets.all(8.0),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 400),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${topRate.posterPath}',
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      // Tambahkan Center di sini
                      child: Text(
                        topRate.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              topRate.popularity.toString(),
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
                              topRate.voteCount.toString(),
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
                              topRate.voteAverage.toString(),
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
