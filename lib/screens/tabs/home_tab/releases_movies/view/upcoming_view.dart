import 'package:flutter/material.dart';
import 'package:movies_app/screens/tabs/home_tab/releases_movies/viewModel/upcoming_viewModel.dart';
import 'package:provider/provider.dart';
import '../widgets/releases_item.dart';

class UpcomingView extends StatefulWidget {
  const UpcomingView({
    super.key,
  });

  @override
  State<UpcomingView> createState() => _UpcomingViewState();
}

class _UpcomingViewState extends State<UpcomingView> {
  UpcomingViewModel viewModel = UpcomingViewModel();
  @override
  void initState() {
    viewModel.getAllUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UpcomingViewModel>(
      create: (BuildContext context) => viewModel,
      child: Consumer<UpcomingViewModel>(builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const CircularProgressIndicator();
        }
        if (viewModel.errorMessage != null) {
          return Text(
            viewModel.errorMessage!,
            style: const TextStyle(fontSize: 16, color: Colors.red),
          );
        }
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: viewModel.newReleases?.length ?? 0,
            itemBuilder: (context, index) => ReleasesItem(
              upComingResults: viewModel.newReleases![index],
            ),
          ),
        );
      }),
    );
  }
}
