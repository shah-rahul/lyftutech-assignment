import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lift/constants/constantManager.dart';
import 'package:lift/models/singleItem.dart';
import 'package:lift/screens/ExpandedItem.dart';

class SingleCard extends StatefulWidget {
  final SingleItem item;
  const SingleCard({super.key, required this.item});

  @override
  State<SingleCard> createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExpandedItem(item: widget.item),
          ),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Container(
          decoration: DecorationManager.boxDecoration,
          margin: EdgeInsets.all(10),
          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 10),
            child: Hero(
              tag: widget.item.id,
              child: Column(
                children: <Widget>[
                  CarouselSlider(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.item.title, style: FontManager.subheading),
                        const SizedBox(height: 10),
                        Text("${widget.item.price.toStringAsFixed(2)} ₹",
                            style: FontManager.heading),
                        const SizedBox(height: 10),
                        Text(
                          widget.item.category.name,
                          style: FontManager.subheading,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
