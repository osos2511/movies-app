import 'package:flutter/material.dart';
import 'package:movies_app/screens/tabs/home_tab/popular/view/popular_view.dart';

import 'new_releases/widgets/new_releases.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PopularView(),
        SizedBox(height: 50,),
        NewReleases(),
      ],
    );
  }
}
