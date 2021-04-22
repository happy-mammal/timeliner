import 'package:flutter/material.dart';

class IntrestChip extends StatefulWidget {
  final String label;
  final Color color;

  const IntrestChip({Key key, this.label, this.color}) : super(key: key);
  @override
  _IntrestChipState createState() => _IntrestChipState();
}

class _IntrestChipState extends State<IntrestChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        onTap: () {
          print('Chiped');
        },
        child: Chip(
          labelPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
          avatar: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white70,
            child: Text(widget.label[0].toUpperCase()),
          ),
          label: Text(
            widget.label,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          deleteIcon: Icon(Icons.add_rounded),
          deleteIconColor: Colors.white,
          onDeleted: () {},
          backgroundColor: widget.color,
          elevation: 6.0,
          shadowColor: Colors.grey[60],
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
