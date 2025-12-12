import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.clear),
            hintText: "Search",
          ),
        ),
      ),
      body: const Center(child: Text("Type something to search")),
    );
  }
}
