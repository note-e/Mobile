import 'package:flutter/material.dart';
import 'note.dart';

class ListViewNotes extends StatelessWidget {
  final List<Note> notes;
  ListViewNotes({Key key, this.notes}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Notes",
          style: new TextStyle(
            fontSize: 19.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: ListView.builder(
            itemCount: notes.length,
            // ignore: missing_return
            itemBuilder: (context, position){
              return Column(
                children: <Widget>[
                  Divider(height: 3.4),
                  ListTile(
                    title: Text("${notes[position].title}",
                      style: new TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text("${notes[position].body}",
                      style: new TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.w400
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                    onTap: ()=> debugPrint("pressed"),
                    /*(){
                        /// open note in Editor Screen
                      }*/
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}


