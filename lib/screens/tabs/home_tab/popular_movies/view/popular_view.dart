import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/model/popular/popular_movie.dart';
import '../../../../../data/model/popular/popular_response.dart';
import '../viewModel/popular_viewModel.dart';
import '../widgets/popular_slider.dart';

class PopularView extends StatefulWidget {
   const PopularView({super.key,});

  @override
  State<PopularView> createState() => _PopularViewState();
}

class _PopularViewState extends State<PopularView> {
  //var  viewModel=PopularViewModel();
  @override
  // void initState() {
  //   viewModel.getAllPopularMovies();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PopularViewModel>(
      create: (BuildContext context) =>PopularViewModel()..getAllPopularMovies(),
    child: Consumer<PopularViewModel>(
        builder: (context, viewModel, child){
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
      return PopularSlider(popularResults: results);
    }),
    );
  }
}
