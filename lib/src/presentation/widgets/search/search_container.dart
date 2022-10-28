import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Ionicons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
