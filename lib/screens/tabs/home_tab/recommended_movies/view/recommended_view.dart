import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/routes_manager.dart';
import 'package:provider/provider.dart';
import '../viewModel/recommended_viewModel.dart';
import '../widgets/recommended_movies.dart';

class RecommendedView extends StatelessWidget {
  const RecommendedView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecommendedViewModel>(
        create:(context) => RecommendedViewModel()..getAllRecommendedMovies(),
      child: Consumer<RecommendedViewModel>(builder: (context, viewModel, child) {
        if(viewModel.isLoading){
          return const CircularProgressIndicator();
        }if(viewModel.errorMessage!=null){
          return Text(
            viewModel.errorMessage!,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: viewModel.results?.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>  InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesManager.popularDetails ,arguments: viewModel.results?[index] );
                },
                child: RecommendedMovies(movieList: viewModel.results?[index],)),),
        );
      },),
    );
  }
}
