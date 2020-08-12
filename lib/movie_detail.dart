import 'package:films_app/model/models.dart';
import 'package:films_app/network/webservice.dart';
import 'package:films_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;
  DetailsScreen(this.movie);

  @override
  _DetailsScreenState createState() => _DetailsScreenState(movie);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final Movie movie;
  _DetailsScreenState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(30.0),
                  bottomRight: const Radius.circular(30.0),
                ),
                image: DecorationImage(
                  image: movie.posterUrl == null
                      ? AssetImage(Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL)
                      : NetworkImage(movie.posterUrl),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Row(
              children: [],
            ),
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
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                movie.overview,
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
