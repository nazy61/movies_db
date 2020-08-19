import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/moviedb_cubit.dart';
import '../../../models/genre.dart';
import '../../../models/movie.dart';
import '../../../constants.dart';
import 'categories.dart';
import 'genres.dart';
import 'movie_carousel.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _initialStart = true;
  final String genreUrl =
      'https://api.themoviedb.org/3/genre/tv/list?api_key=${apiKey}&language=en-US';

  final String movieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${apiKey}&language=en-US&page=1';

  @override
  void initState() {
    super.initState();
    if (_initialStart) {
      Future.delayed(Duration.zero, () {
        getMovies(context, genreUrl);
      });
      _initialStart = false;
    }
  }

  void getMovies(BuildContext context, String url) {
    final movieCubit = context.bloc<MoviedbCubit>();
    movieCubit.getMovies(movieUrl, genreUrl);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviedbCubit, MoviedbState>(builder: (context, state) {
      if (state is MoviedbInitial) {
        return _buildInitialInput();
      } else if (state is MoviedbLoading) {
        return _buildLoading();
      } else if (state is MoviedbLoaded) {
        return _buildBody(state.movies);
      } else {
        // (state is WeatherError)
        return _buildInitialInput();
      }
    });
  }

  Widget _buildInitialInput() {
    return Container(
      child: Center(
        child: Text(
          'No Data',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildBody(List<Movie> movies) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryList(),
          Genres(genres: genres),
          SizedBox(height: kDefaultPadding),
          MovieCarousel(),
        ],
      ),
    );
  }
}
