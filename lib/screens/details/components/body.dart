import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import 'package:movie_info_app/cubit/moviegenra_cubit.dart';
import 'cast_andcrew.dart';
import 'genres.dart';
import 'title_duration_fab_btn.dart';
import '../../../models/movie.dart';
import 'backdrop_rating.dart';

class Body extends StatefulWidget {
  final Movie movie;

  const Body({Key key, this.movie}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var _initialStart = true;

  @override
  void initState() {
    super.initState();
    if (_initialStart) {
      Future.delayed(Duration.zero, () {
        getGenra(context, widget.movie.genraUrl);
      });
      _initialStart = false;
    }
  }

  void getGenra(BuildContext context, String url) {
    final genraCubit = context.bloc<MoviegenraCubit>();
    genraCubit.getMovieGenra(url);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<MoviegenraCubit, MoviegenraState>(
        builder: (context, state) {
      if (state is MoviegenraInitial) {
        return _buildLoading();
      } else if (state is MoviegenraLoading) {
        return _buildLoading();
      } else if (state is MoviegenraLoaded) {
        return _buildBody(genra: state.genra, size: size);
      } else {
        // (state is WeatherError)
        return _buildErrorScreen();
      }
    });
  }

  Widget _buildErrorScreen() {
    return Container(
      child: Center(
        child: Text(
          'Unable to get Movie data',
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

  Widget _buildBody({List<String> genra, Size size}) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackdropAndRating(size: size, movie: widget.movie),
          SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabButton(movie: widget.movie),
          Genres(genra: genra),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              'Plot Summary',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              widget.movie.plot,
              style: TextStyle(color: Color(0xFF737599)),
              textAlign: TextAlign.justify,
            ),
          ),
          CastAndCrew(casts: cast),
        ],
      ),
    );
  }
}
