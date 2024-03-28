import 'package:flutter/material.dart';
import 'package:movie_ui/src/models/tv_models.dart';
import 'package:movie_ui/src/providers/tv_provider.dart';
import 'package:provider/provider.dart';

class TvPage extends StatelessWidget {
  const TvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TvProvider>(
      builder: (context, tvProvider, child) {
        if (!tvProvider.isFetched) {
          if (tvProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            tvProvider.fetchTvProv();
            return SizedBox.shrink();
          }
        } else {
          final List<TV> tvs = tvProvider.tv;
          return SizedBox(
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvs.length,
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (context, index) {
                final TV tvx = tvs[index];
                return Column(
                  children: [
                    AnimatedPadding(
                      padding: EdgeInsets.all(8.0),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 400),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${tvx.posterPath}',
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Center(
                      // Tambahkan Center di sini
                      child: Text(
                        tvx.title,
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
                              tvx.popularity.toString(),
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
                              tvx.voteCount.toString(),
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
                              tvx.voteAverage.toString(),
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
