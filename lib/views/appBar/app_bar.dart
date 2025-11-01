import 'package:api_project/views/home.dart';
import 'package:api_project/views/widgets/materialbutton.dart';
import 'package:flutter/material.dart';

class AppBars extends StatefulWidget {
  const AppBars({super.key});

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Image.asset('assets/maxresdefault.jpg', height: 70),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, size: 27, color: Colors.white),
                ),
                Icon(Icons.download_sharp, size: 27, color: Colors.white),
                SizedBox(width: 10),
                Icon(Icons.cast, size: 27, color: Colors.white),
              ],
            ),
          ),
          CustomMaterialButtons(),
          HomePage(),
        ],
      ),
    );
  }
}
