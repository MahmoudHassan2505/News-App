import 'package:flutter/material.dart';
import 'package:news_app/widgets/categoral_listview.dart';
import 'package:news_app/widgets/new_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "Cloud",
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CategoralListView(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              const NewsListview(),
            ],
          )),
    );
  }
}
