import 'package:api_project/views/bottomNavigation/bottomNavigation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavigation()),
        );
      },
      child: Container(
        width: size.width * .5,
        height: size.height * .05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromARGB(255, 26, 58, 65),
              Color.fromARGB(255, 51, 2, 69),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.redAccent[900],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.red,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
