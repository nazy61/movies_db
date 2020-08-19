import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_info_app/cubit/moviegenra_cubit.dart';
import 'package:movie_info_app/services/movie_services.dart';

import '../../models/movie.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => MoviegenraCubit(MovieDBRepository()),
        child: Body(movie: movie),
      ),
    );
  }
}
