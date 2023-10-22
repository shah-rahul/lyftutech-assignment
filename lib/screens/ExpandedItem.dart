import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lift/constants/constantManager.dart';
import 'package:lift/models/singleItem.dart';

final globalKey = GlobalKey<ScaffoldState>();

class ExpandedItem extends StatefulWidget {
  final SingleItem item;
  const ExpandedItem({super.key, required this.item});

  @override
  State<ExpandedItem> createState() => _ExpandedItemState();
}

class _ExpandedItemState extends State<ExpandedItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: Text(
            widget.item.title,
            style: FontManager.heading,
          ),
        ),
        body: Builder(
          builder: (ctx) => Column(
            children: [
              Hero(
                tag: widget.item.id, // Same tag as in ItemCard
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                  ),
                  items: widget.item.images.map((image) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        decoration: DecorationManager.boxDecoration,
                        child: Image.network(
                          image,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(widget.item.title,
                          style: FontManager.heading.copyWith(fontSize: 24)),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "price :  ${widget.item.price.toString()} ₹",
                          style: FontManager.subheading.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${widget.item.category.name.toString()} ",
                          style: FontManager.subheading.copyWith(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text(
                      widget.item.description,
                      style: FontManager.subheading.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
