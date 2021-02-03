import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jadwal_app/src/model/item.dart';

class CardItem extends StatefulWidget {
  final Item item;

  const CardItem({Key key, this.item}) : super(key: key);
  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.grey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              widget.item.title,
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              widget.item.date,
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.black,
                  backgroundColor: Colors.blueAccent),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              widget.item.deskripsi,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  backgroundColor: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
