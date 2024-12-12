import 'package:flutter/material.dart';
import 'package:movies_app/data/model/popular_movies/popular_movie.dart';
import 'package:movies_app/data/model/popular_movies/popular_response.dart';
import 'package:movies_app/screens/tabs/home_tab/popular/widgets/popular.dart';
import 'package:provider/provider.dart';
import '../viewModel/popular_viewModel.dart';

class PopularView extends StatefulWidget {
   PopularView({super.key,});

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  var viewModel=PopularViewModel();
  @override
  void initState() {
    viewModel.getAllPopularMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PopularViewModel>(
      create: (BuildContext context) =>viewModel,
    child: Consumer(
        builder: (context, value, child){
      if(viewModel.isLoading){
        return const CircularProgressIndicator();
      }
      if(viewModel.errorMessage!=null){
        return Text(
          viewModel.errorMessage!,
          style: const TextStyle(fontSize: 16, color: Colors.red),
        );
      }
      PopularResponse popularResponse=viewModel.popularResponse!;
      List<PopularMovie> results=popularResponse.results??[];
      print(results);
      return Popular(popularResults: results[0]);
    }),
    );
  }
}
