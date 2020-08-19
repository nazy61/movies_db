import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info_app/cubit/genre_cubit.dart';
import 'package:movie_info_app/models/genre.dart';

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
  final String url =
      'https://api.themoviedb.org/3/genre/tv/list?api_key=${apiKey}&language=en-US';

  @override
  void initState() {
    super.initState();
    if (_initialStart) {
      Future.delayed(Duration.zero, () {
        getGenres(context, url);
      });
      _initialStart = false;
    }
  }

  void getGenres(BuildContext context, String url) {
    final genreCubit = context.bloc<GenreCubit>();
    genreCubit.getGenres(url);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenreCubit, GenreState>(builder: (context, state) {
      if (state is GenreInitial) {
        return _buildInitialInput();
      } else if (state is GenreLoading) {
        return _buildLoading();
      } else if (state is GenreLoaded) {
        return _buildBody(state.genres);
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

  Widget _buildBody(List<Genre> genres) {
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
