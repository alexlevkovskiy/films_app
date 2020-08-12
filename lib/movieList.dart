import 'package:films_app/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'movie_detail.dart';
import 'network/webservice.dart';
import 'utils/constants.dart';

class MoviesListState extends State<MoviesList> {
  List<Movie> _moviesArticles = List<Movie>();

  @override
  void initState() {
    super.initState();
    _populateMoviesArticles();
  }

  void _populateMoviesArticles() {
    MovieDBApi.getPlayNow()
        .then((value) => setState(() => {_moviesArticles = value}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _topLayout(),
          Expanded(
            child: ListView.builder(
              itemCount: _moviesArticles.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieListTile(_moviesArticles[index]).build(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _topLayout() {
    return Container(
      height: 150.0,
      decoration: BoxDecoration(
        color: Colors.deepPurple[400],
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(20.0),
          bottomRight: const Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width: double.infinity,
                height: 40.0,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Search ',
                      style: TextStyle(
                        color: Colors.deepPurple[300],
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    const Radius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              _selectedRoundedButton('Popular'),
              _roundedButton('Trending'),
              _roundedButton('Recent')
            ],
          )
        ],
      ),
    );
  }

  Widget _roundedButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: FlatButton(
        onPressed: null,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.white)),
      ),
    );
  }

  Widget _selectedRoundedButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            side: BorderSide(color: Colors.deepOrange)),
        onPressed: () {},
        color: Colors.deepOrange,
        textColor: Colors.white,
        child: Text("Buy now".toUpperCase(), style: TextStyle(fontSize: 14)),
      ),
    );
  }
}

class MovieListTile extends StatelessWidget {
  final Movie movie;
  MovieListTile(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(movie),
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: movie.posterUrl == null
                    ? AssetImage(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
                    : NetworkImage(movie.posterUrl),
                height: 200.0,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    movie.title,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                Text(movie.releaseDate),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class MoviesList extends StatefulWidget {
  @override
  createState() => MoviesListState();
}
