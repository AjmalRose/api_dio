import 'package:api_project/views/appBar/app_bar.dart';
import 'package:flutter/material.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 👈 3 tabs = 3 TabBarView children needed
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 80,
          child: const TabBar(
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
        body: const TabBarView(
          children: [
            AppBars(), // 🏠 Home tab
            Center(
              child: Text("Search Page", style: TextStyle(color: Colors.white)),
            ), // 🔍 Search tab
            Center(
              child: Text(
                "Hot News Page",
                style: TextStyle(color: Colors.white),
              ),
            ), // 📰 News tab
          ],
        ),
      ),
    );
  }
}
