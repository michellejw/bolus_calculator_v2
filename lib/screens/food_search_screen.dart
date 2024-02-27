import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchFoods extends StatefulWidget {
  const SearchFoods({super.key});

  @override
  State<SearchFoods> createState() => _SearchFoodsState();
}

class _SearchFoodsState extends State<SearchFoods> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Foods'),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            Gap(20.0),
          ],
        ),
      ),
    );
  }
}
