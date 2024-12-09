import 'package:flutter/material.dart';
import 'package:movies_app/data/model/popular_movies/popular_results.dart';
import 'package:movies_app/screens/tabs/home_tab/popular/widgets/popular.dart';
import 'package:provider/provider.dart';
import '../viewModel/popular_viewModel.dart';

class PopularView extends StatelessWidget {
   PopularView({super.key,required this.popularResults});
  PopularResults popularResults;
  @override
  Widget build(BuildContext context) {
    var popularViewModel=Provider.of<PopularViewModel>(context);
    return ChangeNotifierProvider<PopularViewModel>(
      create: (BuildContext context) =>PopularViewModel(),
    child: Consumer(
        builder: (context, value, child){
      if(popularViewModel.isLoading){
        return CircularProgressIndicator();
      }
      if(popularViewModel.errorMessage!=null){
        return Text(
          popularViewModel.errorMessage!,
          style: TextStyle(fontSize: 16, color: Colors.red),
        );
      }
      PopularResults?results=popularViewModel.popularResults as PopularResults?;
      return Popular(popularResults: results);
    }),
    );
  }
}
