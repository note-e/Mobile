import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TakeNote extends StatefulWidget {
  @override
  _TakeNoteState createState() => _TakeNoteState();
}

class _TakeNoteState extends State<TakeNote> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final noteController = TextEditingController();
    var now = DateTime.now();
    String formattedTime = DateFormat('KK:mm').format(now);
    String formattedDate = DateFormat('EEE, dd MM').format(now);

    final timeText = Text(
      '$formattedTime',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.white,
      ),
    );

    final dateText = Text(
      '$formattedDate',
      style: TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );

    final titleTextField = TextField(
      controller: titleController,
      decoration: InputDecoration(
        hintText: 'Title',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
      ),
    );

    final noteTextField = TextField(
      controller: noteController,
      textAlign: TextAlign.center,
      maxLines: 10,
      decoration: InputDecoration(
        hintText: 'Your Note',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),

        ),

      ),
    );

    final addBtn = IconButton(
      icon: Icon(Icons.add_circle_outline,
        size: 50.0,
        color: Colors.blue,),
      onPressed: (){ print("Add");},
    );

    return Scaffold(
      appBar: AppBar(
      ),
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ClipPath(
                clipper: MyClipper(),
                child: Container(
                  color: Colors.amber,
                  height: 200.0,
                )),
            Positioned(
              top: 90.0,
              left: 50.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_time, color: Colors.black,),
                  timeText,
                ],
              ),
            ),
            Positioned(
              top: 130.0,
              left: 50.0,
              child: Row(
                children: <Widget>[
                  Icon(Icons.calendar_today, color: Colors.black,),
                  dateText,
                ],
              ),
            ),
            Positioned(
              top: 70.0,
              right: 20.0,
              child: addBtn,
            ),
            Positioned(
              top: 20.0,
              left: 50.0,
              child: Text('Keep It',
                style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                ),
              ),
            ),

          ],
        ),
         Container(
           width: 200.0,
           child: Padding(
             padding: EdgeInsets.all(8.0),
              child : titleTextField,
         ),
         ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child : noteTextField,
          ),
        ),      ],
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-50);
    path.quadraticBezierTo(size.width/4, size.height, size.width/2, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width/2, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
