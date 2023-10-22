import 'package:flutter/material.dart';
import 'package:lift/api/dbservice.dart';
import 'package:lift/components/SingleCard.dart';
import 'package:lift/constants/constantManager.dart';
import 'package:lift/models/singleItem.dart';
import 'package:lift/provider/itemListProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<SingleItem>>? _products;
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    if (productProvider.loadedOnce == false) {
      productProvider.fetchProducts();
    }
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'LiftShop',
        style: FontManager.subheading
            .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
      )),
      body: Column(
        children: [
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      productProvider.filter('All');
                    },
                    child: Text('All'),
                  ),
                ),
                for (final category in productProvider.categories)
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        productProvider.filter(category);
                      },
                      child: Text(category),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: FutureBuilder(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: productProvider.products.length ~/ 2,
                    itemBuilder: (context, index) {
                      final product = productProvider.products[index * 2];
                      final nextProduct =
                          productProvider.products[index * 2 + 1];
                      return Container(
                          child: Row(
                        children: [
                          SingleCard(item: product),
                          SingleCard(item: nextProduct),
                        ],
                      ));
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class list {}
