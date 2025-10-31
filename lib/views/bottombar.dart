import 'package:api_project/views/appBar/app_bar.dart';
import 'package:flutter/material.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home_max_outlined), text: "Home"),
              Tab(icon: Icon(Icons.search_outlined), text: "Search"),
              Tab(icon: Icon(Icons.newspaper_outlined), text: "Hot News"),
            ],
            unselectedLabelColor: Colors.blueGrey,
            labelColor: Colors.white,
            indicatorColor: Colors.red,
          ),
        ),
        body: TabBarView(children: [AppBars(), Scaffold()]),
      ),
    );
  }
}
